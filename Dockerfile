# Alpine Linux with OpenJDK JRE
FROM openjdk:8u342-jre-windowsservercore-ltsc2022

EXPOSE 8181

# copy jar into image
COPY target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar /usr/bin/spring-petclinic.jar

# run application with this command line 
ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic.jar","--server.port=8181"]
