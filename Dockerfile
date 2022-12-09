FROM maven:3-adoptopenjdk-11 as builder

COPY src /app/src
COPY pom.xml /app

RUN mvn -f /app/pom.xml clean package -DskipTests
VOLUME ["./volumes123"]

FROM adoptopenjdk:11-jre-hotspot as app
COPY /app/target .
COPY bwell-0.0.1-SNAPSHOT.jar application.jar
ENTRYPOINT ["java","-jar","/application.jar"]
