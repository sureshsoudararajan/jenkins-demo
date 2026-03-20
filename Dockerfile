# Use lightweight Java runtime
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy jar from target folder
COPY target/jenkins-demo-0.0.1-SNAPSHOT.jar app.jar

# Expose application port
EXPOSE 8081

# Run the application
ENTRYPOINT ["java","-jar","/app/app.jar","--server.port=8081","--server.address=0.0.0.0"]
