FROM node:lts-slim as builder

ENV NODE_OPTIONS=--openssl-legacy-provider
WORKDIR /build
COPY . .

RUN npm install && \
    npx --yes browserslist@latest --update-db && \
    npm run build
