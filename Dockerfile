FROM node:20.5.0-slim as base
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN npm install

ENV HOST=0.0.0.0
ENV PORT=4321
EXPOSE 4321

CMD ["npm", "run", "dev"]



