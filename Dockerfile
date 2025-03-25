FROM maven:3.9.2 AS buildjar
COPY . .
RUN mvn package

FROM openjdk:17-alpine AS runnable
COPY --from=buildjar target/*.jar .
CMD java -jar *.jar
