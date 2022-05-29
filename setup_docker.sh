echo "Creating network"
docker network create js-docker-network
echo "Start mongo container"
docker run -d -p 27017:27017 -v js-docker-volume:/data/db --network js-docker-network -h mongo-host --name mongo mongo
echo "Start redis container"
docker run -d -p 6379:6379 --network js-docker-network --name redis -h redis-host redis redis-server
echo "Building app image"
docker build -t app:local .
echo "Start app container" 
docker run -d --network js-docker-network --name app -h app app:local