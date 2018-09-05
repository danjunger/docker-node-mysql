FROM node:10.7

RUN wget -O cf.tgz "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github"
RUN tar -xvzf ./cf.tgz

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list \
 && apt-get update -yq \
 && apt-get install -yq google-chrome-stable

RUN apt-get update -yq \
 && apt-get install -yq xvfb

RUN apt-get -y update
RUN npm install -g yarn
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
RUN find /var/lib/mysql -type f -exec touch {} \; && service mysql start
