FROM alpine AS BUILD
WORKDIR /app
COPY . .
CMD ./gradlew build

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=BUILD /app/build/libs/*.jar .

EXPOSE 8080


CMD ["java", "-jar", "*.jar"]


