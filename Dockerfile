FROM openjdk:17-jdk-slim as builder

WORKDIR /app

COPY . .

RUN export MAVEN_OPTS="-Xmx3072m" && ./mvnw package 

FROM openjdk:18-jdk-alpine3.15

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/app.jar

RUN chmod +x app.jar .

CMD ["java", "-XX:MaxRAMPercentage=75.0", "-jar", "app.jar"]
