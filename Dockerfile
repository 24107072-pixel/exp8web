# 1. Use the official Java 21 runtime base image
FROM eclipse-temurin:21-jre-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy your local JAR file into the container
COPY target/my-app-1.0.jar app.jar

# 4. Expose the port your application listens on
EXPOSE 8080

# 5. Define the command to run your Java 21 JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
