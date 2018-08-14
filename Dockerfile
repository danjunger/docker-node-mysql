FROM node:10.8

RUN apt-get -y update
RUN apt-get -y install mysql-server

