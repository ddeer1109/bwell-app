# ================================
# Build Stage
# ================================
FROM maven:3.9-eclipse-temurin-11-alpine AS builder

WORKDIR /app

# Copy only pom.xml first for dependency caching
COPY pom.xml .

# Download dependencies (cached layer if pom.xml unchanged)
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests -B

# ================================
# Runtime Stage
# ================================
FROM eclipse-temurin:11-jre-alpine AS runtime

# Add non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy the built artifact
COPY --from=builder /app/target/bwell-0.0.1-SNAPSHOT.jar application.jar

# Change ownership to non-root user
RUN chown -R appuser:appgroup /app

USER appuser

# Expose the application port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# JVM tuning for containers
ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar application.jar"]
