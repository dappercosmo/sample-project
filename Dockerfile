# Start with a base image for Java
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot JAR file
COPY target/sample-project-0.0.1-SNAPSHOT.jar app.jar

# Expose the default port
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
