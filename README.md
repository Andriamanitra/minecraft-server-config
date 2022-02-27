# Dockerized Minecraft server configuration

Simple Docker setup for fabric + carpet Minecraft server

## What is this?

* Dockerfile so I don't need to remember how to spin up a server quickly
* `server.properties` configuration (difficulty, world border, ...)
* [Carpet mod](https://github.com/gnembon/fabric-carpet) configuration file with my preferred settings
* A custom datapack to make some minor tweaks to loot tables


## How to use:

```console
$ git clone https://github.com/andriamanitra/minecraft-server-config.git
$ cd minecraft-server-config
$ docker build --tag mc-server .
$ docker run --rm --detach -p 25565:25565 --volume $PWD/world:/mcserver/world mc-server
```

To provide custom options to Java (for example to allocate different amount of RAM, or to optimize garbage collection) you can add something like `--env JAVA_OPTS="-Xmx8G -Xms8G"` to the last command.


## TODO:

Make a nice docker compose file to make configuration even easier
