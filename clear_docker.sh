echo "Killing containers"
docker kill app redis mongo
echo "Removing dead containers"
docker container rm app redis mongo
echo "Deleting network"
docker network rm js-docker-network
