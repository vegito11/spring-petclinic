FROM openjdk:17-jdk-slim

COPY . .

RUN ./mvnw package

ENTRYPOINT ["java", "-jar", "target/*.jar"]

