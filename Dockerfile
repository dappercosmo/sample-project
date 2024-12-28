FROM maven:latest AS builder
WORKDIR /app
COPY . .
# Fix permissions for mvnw
RUN chmod +x ./mvnw
RUN ./mvnw clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

# Cloud Run will set PORT environment variable
ENV PORT=8080
EXPOSE ${PORT}

# Command to run the application
CMD ["java", "-Dserver.port=${PORT}", "-jar", "app.jar"]