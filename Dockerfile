FROM node

RUN mkdir /app
WORKDIR /app

COPY package.json /app/package.json
RUN yarn

COPY src /app/src
COPY public /app/public
