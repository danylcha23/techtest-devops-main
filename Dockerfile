FROM eclipse-temurin:21-jdk
WORKDIR /app

# Copy all files from your flattened root directory
COPY . .

# Ensure the wrapper can run on the Linux container
RUN chmod +x mvnw

# Build the Fat JAR and rename it for a static entrypoint
RUN ./mvnw clean package -DskipTests
RUN cp target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]