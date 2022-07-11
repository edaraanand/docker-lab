# Create docker volume
docker volume ls
docker volume create jenkins-vol-1
docker inspect jenkins-vol-1

# Run container inside the container, docker daemon process should be provided
docker run -itd -p 8089:8080 -p 50001:50000 -d -v /var/run/docker.sock:/var/run/docker.sock -v jenkins-vol-1:/var/jenkins_home edaraanand/jenkins:v1

# To check the volume files
docker run -it -v jenkins-vol-1:/data centos:latest

# docker Compose
docker-compose -f <docker-compose.yml>
docker-compose up
docker-compose down
docker-compose up -d service-one
docker-compose up -d service-two
docker-compose stop service-one
docker-compose stop service-two
docker-compose rm service-one
docker-compose rm service-two
docker-compose exec service-one bash
docker-compose exec service-two bash
docker ps
docker ps -a
docker logs -f container_id
docker-compose logs -f service-one
docker-compose logs -f service-two
docker-compose up --scale service-one=4 --scale service-two=2