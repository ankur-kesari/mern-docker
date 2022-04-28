#!bin/bash

apt-get update
apt-get install git -y


#installing node for npm
apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get -y install nodejs

#install nginx
#apt-get -y install nginx FROM nginx in dockerfile

#cloning repo
git clone https://github.com/Ashutosh-aws/react-redux-realworld-example-app.git
cd react-redux-realworld-example-app


#changing root api for connecting the backend
sed -i 's/abc/3.110.82.144:3000/' src/agent.js
sed -i 's/https:/http:/' src/agent.js

#installing dependencies
npm install

npm run build

#builtin nginx location
rm /usr/share/nginx/html/index.html    
cp -r build/* /usr/share/nginx/html/


