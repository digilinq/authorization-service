# Stage 2: Create minimal runtime image
FROM eclipse-temurin:21-jre

# Declare the ARG with a default value
ARG JAR_FILE

# Set working directory
WORKDIR /app

# Copy the jar file from the build directory
COPY ${JAR_FILE} ./svc.jar

# Expose port 8080 (default Spring Boot port)
EXPOSE 8080

# Set the user to run the application
USER 1000:1000

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "svc.jar"]
