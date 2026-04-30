FROM eclipse-temurin:21-jdk

# Traceability
ARG GIT_COMMIT=unspecified
LABEL commit_sha=$GIT_COMMIT

WORKDIR /app

# 1. Copy the wrapper files into /app
COPY app/mvnw ./
COPY app/.mvn ./.mvn
COPY app/pom.xml ./

# 2. Grant execution permission inside the container
RUN chmod +x mvnw

# 3. Copy the source code
COPY app/src ./src

# 4. Build directly (no 'cd app' needed)
RUN ./mvnw clean package -DskipTests

# 5. Prepare final jar
RUN cp target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]