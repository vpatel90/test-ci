FROM node:10-alpine

RUN apk add --update --upgrade --no-cache tini \
  git \
  libc6-compat

COPY package.json /service/

WORKDIR /service

RUN npm install

COPY . /service

ENTRYPOINT ["/sbin/tini", "--"]
