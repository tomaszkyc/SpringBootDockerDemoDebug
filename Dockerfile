FROM maven:3.5.3-jdk-8-alpine

WORKDIR /project
COPY pom.xml .

# Download all dependencies to create a cached layer
RUN mvn de.qaware.maven:go-offline-maven-plugin:resolve-dependencies
COPY . .
RUN mvn package


ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/project/target/demo-0.0.1-SNAPSHOT.jar"]