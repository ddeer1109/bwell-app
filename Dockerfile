FROM maven:3-adoptopenjdk-11 as builder

WORKDIR .
COPY src /app/src
COPY pom.xml /app

RUN mvn -f /app/pom.xml clean package -DskipTests
VOLUME ["./volumes123"]
RUN ls -R /app


FROM adoptopenjdk:11-jre-hotspot as app
COPY --from=builder /app/target/bwell-0.0.1-SNAPSHOT.jar application.jar
ENTRYPOINT ["java","-jar","/application.jar"]
