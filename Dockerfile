# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set environment variables for database connection
ENV SPRING_DATASOURCE_URL=jdbc:mysql://mysql-container:3306/sample_db
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=Rakeshmp@04

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build context into the container
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Expose the port your application runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
