# ==========================================
# Giai đoạn 1: Build ứng dụng (Builder)
# ==========================================
FROM eclipse-temurin:17-jdk-alpine AS builder

WORKDIR /app

# 1. Copy Gradle wrapper và file cấu hình
COPY gradlew .
COPY gradle gradle
COPY build.gradle settings.gradle ./

# Cấp quyền thực thi cho script gradlew
RUN chmod +x ./gradlew

# 2. Tải dependency trước để tận dụng cache của Docker
RUN ./gradlew dependencies --no-daemon

# 3. Copy source code và build file JAR (bỏ qua test)
COPY src src
RUN ./gradlew bootJar --no-daemon -x test

# ==========================================
# Giai đoạn 2: Runtime (Mặc định chạy quyền root)
# ==========================================
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy file jar trực tiếp từ builder
COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar", "app.jar"]