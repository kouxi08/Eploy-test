FROM node:20.5.0-slim as base

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

ARG endpoint
ARG usessl
ARG accesskey
ARG secretkey


ENV ENDPOINT=${endpoint}
ENV USE_SSL=true
ENV ACCESS_KEY=${accesskey}
ENV SECRET_ACCESS_KEY=${secretkey}

RUN npm run build


ENV HOST=0.0.0.0
ENV PORT=4321
EXPOSE 4321

CMD ["node" ,"/usr/src/app/dist/server/entry.mjs"]


