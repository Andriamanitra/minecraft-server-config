FROM openjdk:latest

ENV JAVA_OPTS="-Xmx4G -Xms4G"

WORKDIR /mcserver

COPY eula.txt server.properties /mcserver/

# Modify these to install a different version:
RUN mkdir /mcserver/mods && \
    curl -Lo /mcserver/fabric-server.jar "https://meta.fabricmc.net/v2/versions/loader/1.19_deep_dark_experimental_snapshot-1/0.13.3/0.10.2/server/jar" && \
    curl -Lo /mcserver/mods/carpet-mod.jar "https://github.com/gnembon/fabric-carpet/releases/download/1.4.ddexp/fabric-carpet-1.19_deep_dark_experimental_snapshot-1-1.4.59_ddexp+v220217.jar" && \
    curl -Lo /mcserver/mods/fabric-api.jar "https://media.forgecdn.net/files/3656/12/fabric-api-0.46.5%2B1.19_experimental.jar"


CMD java $JAVA_OPTS -jar fabric-server.jar
