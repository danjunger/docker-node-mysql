FROM node:10.7

RUN apt-get -y update
RUN npm install -g yarn	
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server	
RUN find /var/lib/mysql -type f -exec touch {} \; && service mysql start
