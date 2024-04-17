FROM maven:3.8.4-openjdk-17 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests

FROM adoptopenjdk:17-jre-hotspot
COPY --from=build /target/DogsManagementSystem-0.0.1-SNAPSHOT.jar /DogsManagementSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "/DogsManagementSystem.jar"]
