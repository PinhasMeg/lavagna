FROM maven:3.6.1-jdk-8-alpine AS base
WORKDIR /doc
COPY . .
RUN mvn clean stampo:build

FROM nginx
WORKDIR /etc/nginx/html
COPY --from=base /doc/target/ ./

COPY --from=base /doc/nginx.conf /etc/nginx/