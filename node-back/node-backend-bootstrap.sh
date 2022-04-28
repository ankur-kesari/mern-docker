#!bin/bash
apt-get update
apt-get install curl -y

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs 

#To install the Yarn package manager, run:
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn
 
apt-get install wget -y
apt-get install git -y
apt-get install ca-certificates -y

#downloading and adding the MongoDB key
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
#adding MongoDB repository
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list

apt-get update
apt-get install -y mongodb
service mongodb start

git clone https://github.com/Ashutosh-aws/node-express-mern-cicd.git
cd /node-express-mern-cicd


#installing dependency for node application
npm install
sed -i 's/abc/localhost:27017/' app.js

npm install pm2 -g

env PATH=$PATH:/usr/local/bin pm2 startup -u ubuntu

pm2 start app.js
