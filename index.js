const { MongoClient } = require("mongodb");
const { createClient } = require("redis");


  const run = async () => {
    await mongoHealthcheck()
    await redisHealthcheck()
  }

  const redisHealthcheck = async () => {
    const client = createClient({
      url: 'redis://redis-host:6379'
    });
    await client.connect()
    const info = await client.info()
    console.log(info)
  }
  
  const mongoHealthcheck =  async () => {
    const client = new MongoClient("mongodb://mongo-host:27017")

    await client.connect()
    const db = client.db("dbname")
    const stats = await db.stats()
    console.log(stats)
    await client.close()
  }
  run().then()