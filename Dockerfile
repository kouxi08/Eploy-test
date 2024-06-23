FROM node:20.5.0-slim as base
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN npm install

RUN npm run build

FROM node:20.5.0-slim as runtime
COPY --from=base /usr/src/app/node_modules ./var/app/node_modules
COPY --from=base /usr/src/app/dist ./var/app/dist

ENV HOST=0.0.0.0
ENV PORT=4321
EXPOSE 4321
CMD node ./var/app/dist/server/entry.mjs


