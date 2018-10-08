FROM node

RUN mkdir /app
WORKDIR /app

COPY "$PWD/package.json" /app/package.json
RUN yarn

COPY "$PWD/src" /app/src
COPY "$PWD/public" /app/public
