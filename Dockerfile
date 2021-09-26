FROM maven:3.6.1-jdk-8-alpine

#FROM openjdk:8-jre-alpine
EXPOSE 8080
#RUN mvn verify

# ENV DB_DIALECT MYSQL
# ENV DB_URL jdbc:mysql://mysql:3306/lavagna
# ENV DB_USER mysql
# ENV DB_PASS 123456
# ENV SPRING_PROFILE prod

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl 

COPY . /app
WORKDIR /app

RUN chmod +x entrypoint.sh

WORKDIR /app/src/main/
RUN rm -rf webapp
WORKDIR /app

# Execute the web archive
ENTRYPOINT  ["./entrypoint.sh"]


