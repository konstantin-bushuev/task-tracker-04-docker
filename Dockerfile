FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY gradlew .
COPY gradle gradle
COPY build.gradle.kts .
COPY settings.gradle.kts .
COPY src src

RUN chmod +x gradlew

RUN ./gradlew bootJar --no-daemon

EXPOSE 8080

CMD ["java", "-jar", "build/libs/task-tracker-04-docker-0.0.1-SNAPSHOT.jar"]