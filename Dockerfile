FROM node:10.8

RUN apt-get update
RUN apt-get install mysql-server
RUN mysql_secure_installation
RUN mysqld --initialize
RUN service mysql start
