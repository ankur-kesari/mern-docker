#!bin/bash

apt-get update
apt-get install git -y


#installing node for npm
apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get -y install nodejs npm

#install nginx
apt-get -y install nginx

#cloning repo
git clone https://github.com/gothinkster/react-redux-realworld-example-app.git
cd react-redux-realworld-example-app


#changing root api for connecting the backend
sed -i 's/conduit.productionready.io/52.66.100.173:3000/' src/agent.js
sed -i 's/https:/http:/' src/agent.js

#installing dependencies
npm install

npm run build


cp -r build/* /var/www/html/

service nginx restart
