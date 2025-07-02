# Stage 1: Build the application
FROM gradle:8.4-jdk21 AS builder

# Set working directory
WORKDIR /workspace

# Copy Gradle wrapper and build files first to leverage caching
COPY build.gradle settings.gradle gradlew gradlew.bat /workspace/
COPY gradle /workspace/gradle

# Run Gradle wrapper to download dependencies
RUN ./gradlew build -x test --no-daemon || return 0

# Copy the entire project
COPY . /workspace

# Build the Spring Boot application
RUN ./gradlew bootJar --no-daemon

# Stage 2: Create minimal runtime image
FROM eclipse-temurin:21-jre

# Set working directory
WORKDIR /app

# Copy the built jar from builder stage
COPY --from=builder /workspace/build/libs/svc.jar ./

# Expose port 8080 (default Spring Boot port)
EXPOSE 8080

# Set the user to run the application
USER 1000:1000

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "svc.jar"]
