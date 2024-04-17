FROM maven:3.8.4-openjdk-16 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -Pprod -DskipTests

FROM adoptopenjdk:16-jre-hotspot
WORKDIR /app
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "DogsManagementSystem.jar"]
