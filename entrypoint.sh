#!/bin/sh

./wait-for http://mysql:3306 


# #cd ./target
# while ! wget http://mysql:3306 ; do 
# sleep 5
# done

java -Xms64m -Xmx128m -Ddatasource.dialect=MYSQL \
-Ddatasource.url=jdbc:mysql://mysql:3306/lavagna?useSSL=false \
-Ddatasource.username=root \
-Ddatasource.password=pass \
-Dspring.profiles.active=dev \
-jar ./target/lavagna-jetty-console.war --headless