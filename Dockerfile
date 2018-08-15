FROM node:10.7

RUN apt-get install apt-transport-https
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list

RUN apt-get -y update
RUN npm install -g yarn
RUN apt-get install -y cf-cli
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server	
RUN find /var/lib/mysql -type f -exec touch {} \; && service mysql start

