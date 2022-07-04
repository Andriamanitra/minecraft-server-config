FROM openjdk:latest

ENV JAVA_OPTS="-Xmx4G -Xms4G"

WORKDIR /mcserver

COPY eula.txt server.properties /mcserver/

# Modify these to install a different version:
RUN mkdir /mcserver/mods && \
    curl -Lo /mcserver/fabric-server.jar "https://meta.fabricmc.net/v2/versions/loader/1.19.1-pre2/0.14.8/0.11.0/server/jar" && \
    curl -Lo /mcserver/mods/carpet-mod.jar "https://github.com/gnembon/fabric-carpet/releases/download/1.4.79/fabric-carpet-1.19-1.4.79+v220607.jar" && \
    curl -Lo /mcserver/mods/fabric-api.jar "https://github.com/FabricMC/fabric/releases/download/0.57.1%2B1.19.1/fabric-api-0.57.1+1.19.1.jar"


CMD java $JAVA_OPTS -jar fabric-server.jar
