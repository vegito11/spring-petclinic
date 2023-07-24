FROM openjdk:17-jdk-slim

WORKDIR /app

COPY . .

RUN ./mvnw package

ENTRYPOINT ["java", "-jar", "target/*.jar"]

