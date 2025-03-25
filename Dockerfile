FROM maven:3.9.2 AS buildjar
COPY . .
#RUN mvn build-helper:parse-version versions:set \
#    -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion}-SNAPSHOT
RUN mvn package

FROM openjdk:17 AS runnable
COPY --from=buildjar target/*.jar .
CMD java -jar *.jar
