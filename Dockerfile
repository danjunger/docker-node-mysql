FROM node:10.7

RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list

RUN apt-get -y update
RUN npm install -g yarn	cf-cli
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server	
RUN find /var/lib/mysql -type f -exec touch {} \; && service mysql start

