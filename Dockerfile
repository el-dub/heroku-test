# вопрос по персии jdk: где брать самые последние версии продукта (в примере 8-alpine)
# нашел на https://hub.docker.com/

FROM maven:3.8.1-jdk-11-slim AS MAVEN_BUILD

COPY pom.xml /build/
COPY src /build/src

WORKDIR /build/
RUN mvn package
# нашел на https://hub.docker.com/
FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/heroku-test-lala-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java","-jar", "heroku-test-lala-0.0.1-SNAPSHOT.jar"]
#CMD [ "sh", "-c", "java -Dserver.port=$PORT -Xmx280m -jar discount-1.0-SNAPSHOT.jar"]