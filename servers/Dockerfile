FROM node

WORKDIR /usr/src/app
ENV NODE_ENV production
copy ["package.json","package-lock.json", "./"]

run npm i -g pm2
run npm i --production --silent && mv node_modules ../

copy . .

expose 3012
cmd pm2 start pm2.config.js
