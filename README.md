# Create docker volume
docker volume ls
docker volume create jenkins-vol-1
docker inspect jenkins-vol-1

# Run container inside the container, Docker daemon process should be provided
docker run -itd -p 8089:8080 -p 50001:50000 -d -v /var/run/docker.sock:/var/run/docker.sock -v jenkins-vol-1:/var/jenkins_home edaraanand/jenkins:v1

# To check the volume files
docker run -it -v jenkins-vol-1:/data centos:latest