## Use the official Maven image to build the application
#FROM maven:latest AS builder
#
## Set the working directory in the container
#WORKDIR /app
#
## Copy the Maven wrapper and POM file
#COPY .mvn/ .mvn
#COPY mvnw pom.xml ./
#
## Set execute permissions for mvnw
#RUN chmod +x ./mvnw
#
## Copy the source code
#COPY src ./src
#
## Run the Maven build
#RUN ./mvnw package -DskipTests
#
## Use a lighter OpenJDK image for the runtime
#FROM eclipse-temurin:17-jre
#
## Set the working directory in the runtime container
#WORKDIR /app
#
## Copy the packaged JAR file from the builder stage
#COPY --from=builder /app/target/sample-project-0.0.1-SNAPSHOT.jar app.jar
#
## Expose the port the app will run on
#EXPOSE 8080
#
## Run the application
#ENTRYPOINT ["java", "-jar", "/app/app.jar"]

FROM maven:latest AS builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

# Cloud Run will set PORT environment variable
ENV PORT=8080
EXPOSE ${PORT}

# Command to run the application
CMD ["java", "-Dserver.port=${PORT}", "-jar", "app.jar"]
