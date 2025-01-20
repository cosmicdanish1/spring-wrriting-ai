# Use a base image with Java 21 installed
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the packaged JAR file into the container
COPY target/email-writer-sb-0.0.1-SNAPSHOT.jar app.jar

# Expose the application's port (e.g., 8080)
EXPOSE 8080

# Define the command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]


