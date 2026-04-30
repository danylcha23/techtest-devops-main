FROM eclipse-temurin:21-jdk
WORKDIR /app

# 1. Copy files from the root (since you moved them out of /app)
COPY mvnw ./
COPY .mvn ./.mvn
COPY pom.xml ./
COPY src ./src

# 2. Permissions and Build
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests
RUN cp target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]