FROM node:lts-slim AS builder

ENV NODE_OPTIONS=--openssl-legacy-provider
WORKDIR /build
COPY . .

RUN npm install && \
    npx --yes browserslist@latest --update-db && \
    npm run build


FROM crunchgeek/php-fpm:8.2 AS final

WORKDIR /app
COPY --from=builder /build/build/_h5ai/ /app/_h5ai/
