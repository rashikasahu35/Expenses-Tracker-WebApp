# Stage 1 - build app
FROM maven:3.8.3-openjdk-17 AS builder 
WORKDIR /app
COPY . /app
RUN mvn clean install -DskipTests=true

#Stage 2 - run app
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar /app/target/expenseapp.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/target/expenseapp.jar"]