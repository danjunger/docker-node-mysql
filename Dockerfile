FROM node:10.7

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
