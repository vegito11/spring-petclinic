FROM openjdk:17-jdk-slim

WORKDIR /app

COPY . .

RUN export MAVEN_OPTS="-Xmx3072m" && ./mvnw package 

RUN chmod +x -R target/*.jar

ENTRYPOINT ["java", "-jar", "target/*.jar"]

