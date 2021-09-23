FROM maven:3.8.2-jdk-8
COPY . /app
WORKDIR /app
#RUN mvn verify


RUN apt-get update && \
    apt-get install ca-certificates && \
    update-ca-certificates && \
    apt-get install openssl;

ENV DB_DIALECT HSQLDB
ENV DB_URL jdbc:hsqldb:file:lavagna
ENV DB_USER sa
ENV DB_PASS ""
ENV SPRING_PROFILE dev

COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 8080

# Execute the web archive
ENTRYPOINT  ["./entrypoint.sh"]


