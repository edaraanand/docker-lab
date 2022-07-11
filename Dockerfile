FROM jenkins/jenkins:lts
MAINTAINER anand.edara@gmail.com
USER root

RUN apt-get update -y \
    && apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
# RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update -y
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update -y

RUN apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y 

RUN cd /var/lib/jenkins && git init

RUN git remote add origin git@github.com:edaraanand/jenkins-backup.git
