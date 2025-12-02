# ---- Stage 1: Build the app ----
    FROM maven:3.9-eclipse-temurin-17 AS builder

    WORKDIR /app
    
    # Copy pom.xml and download dependencies first (cache layer)
    COPY pom.xml .
    RUN mvn dependency:go-offline
    
    # Copy source code
    COPY src ./src
    
    # Build (this produces target/docker-test-app-1.0.0.jar)
    RUN mvn package -DskipTests
    
    # ---- Stage 2: Runtime image ----
    FROM eclipse-temurin:17-jre
    
    WORKDIR /app
    
    # Copy jar from builder
    COPY --from=builder /app/target/*.jar app.jar
    
    ENTRYPOINT ["java", "-jar", "app.jar"]
    