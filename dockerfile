FROM eclipse-temurin:21-jdk

# --- ADD THIS FOR TRACEABILITY ---
ARG GIT_COMMIT=unspecified
LABEL commit_sha=$GIT_COMMIT
# --------------------------------

WORKDIR /workspace

COPY app/pom.xml app/pom.xml
COPY app/src app/src

RUN cd app && ./mvnw -q test package || (mvn -q test package)

WORKDIR /app
RUN cp /workspace/app/target/*.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
