# ---- Stage 1: Build the application ----
    FROM eclipse-temurin:17-jdk AS builder

    WORKDIR /app
    
    # Copy source code
    COPY src ./src
    
    # Compile the Java source files
    RUN mkdir out && javac -d out src/Main.java
    
    # Create JAR
    RUN jar cfe app.jar Main -C out .
    
    # ---- Stage 2: Run the application ----
    FROM eclipse-temurin:17-jre AS runtime
    
    WORKDIR /app
    
    COPY --from=builder /app/app.jar .
    
    ENTRYPOINT ["java", "-jar", "app.jar"]
    