FROM openjdk:latest

ENV JAVA_OPTS="-Xmx4G -Xms4G"

WORKDIR /mcserver

COPY eula.txt server.properties /mcserver/

# Modify these to install a different version:
ADD "https://meta.fabricmc.net/v2/versions/loader/1.19.2/0.14.9/0.11.1/server/jar" /mcserver/fabric-server.jar
ADD "https://github.com/FabricMC/fabric/releases/download/0.61.0%2B1.19.2/fabric-api-0.61.0+1.19.2.jar" /mcserver/mods/fabric-api.jar
ADD "https://github.com/gnembon/fabric-carpet/releases/download/1.4.83/fabric-carpet-1.19.1-1.4.83+v220727.jar" /mcserver/mods/carpet-mod.jar

CMD java $JAVA_OPTS -jar fabric-server.jar
