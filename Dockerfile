# Use Node 22 for build
FROM node:22 AS builder

WORKDIR /app

COPY element-web .

RUN yarn install && yarn build

# Serve with NGINX
FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

COPY config.json /usr/share/nginx/html/config.json

EXPOSE 80
