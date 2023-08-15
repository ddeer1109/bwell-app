FROM maven:3-adoptopenjdk-11 as builder

WORKDIR .
VOLUME ["./app"]
RUN bash
COPY src /app/src
COPY pom.xml /app
COPY create_certificates.sh /app
RUN mvn -f /app/pom.xml clean package -DskipTests

FROM adoptopenjdk:11-jre-hotspot as app
COPY --from=builder /app/target/bwell-0.0.1-SNAPSHOT.jar application.jar
COPY --from=builder /app/create_certificates.sh .
#COPY --from=builder /app/certs/create_certificates.sh .
#COPY --from=builder /app/certs/openssl.cnf .
#RUN bash /create_certificates.sh
ENTRYPOINT ["java","-jar","/application.jar"]
