FROM node:10.7

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update

RUN debconf-set-selections << 'mariadb-server-10.0 mysql-server/root_password password PASS'
RUN debconf-set-selections << 'mariadb-server-10.0 mysql-server/root_password_again password PASS'
RUN apt-get install mariadb-server -y

RUN npm install -g yarn

RUN service mysql start
