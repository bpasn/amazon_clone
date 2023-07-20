FROM node

WORKDIR /usr/src/app
ENV NODE_ENV production
COPY ["package.json","package-lock.json", "./"]

RUN npm i -g pm2
RUN npm i --production --silent && mv node_modules ../

COPY . .

EXPOSE 3012
CMD pm2 start pm2.config.js
