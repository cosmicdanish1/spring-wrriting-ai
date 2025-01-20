# Use the official OpenJDK image as the base image for building the application
FROM openjdk:17-jdk-slim as build

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set the working directory in the container
WORKDIR /app

# Copy the Maven pom.xml file and download dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the source code into the container
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Use the OpenJDK base image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/email-writer-sb.jar /app/email-writer-sb.jar

# Run the application
ENTRYPOINT ["java", "-jar", "email-writer-sb.jar"]

