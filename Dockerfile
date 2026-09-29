# --- Stage 1: Build the application ---
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app

# Copy the build configuration and source code
COPY pom.xml .
COPY src ./src

# Compile and package the application (skipping tests to speed up deployment)
RUN mvn clean package -DskipTests

# --- Stage 2: Create the runtime image ---
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copy the built JAR from the first stage
COPY --from=build /app/target/exp8web-0.0.1-SNAPSHOT.jar app.jar

# Expose the port (Render handles this dynamically, but good for reference)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

