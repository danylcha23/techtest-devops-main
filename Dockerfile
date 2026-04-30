# 1. Use a base image with JDK 21
FROM eclipse-temurin:21-jdk
WORKDIR /app

# 2. Copy the entire project into the container
# Since we flattened the structure, everything is in the root
COPY . .

# 3. Ensure the wrapper is executable (critical for Linux/GitHub Actions)
RUN chmod +x mvnw

# 4. Build the application (The steps you asked about)
RUN ./mvnw clean package -DskipTests
RUN cp target/*.jar app.jar

# 5. Expose the port defined in your application.yml
EXPOSE 8080

# 6. Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]