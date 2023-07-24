FROM openjdk:17-jdk-slim

WORKDIR /app

COPY . .

RUN export MAVEN_OPTS="-Xmx3072m -XX:MaxPermSize=128m" && ./mvnw package

ENTRYPOINT ["java", "-jar", "target/*.jar"]

