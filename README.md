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
$ docker run --detach --interactive --tty --name minecraft -p 25565:25565 --volume $PWD/world:/mcserver/world mc-server
```

* Not using `--rm` flag means the container will persist even after it is stopped,
  so be careful to restart the existing one (`docker start minecraft`) instead of
  creating another one (`docker run ...`)

* `--detach` makes the container run in background (no need for screen or tmux)

* `--interactive` and `--tty` flags are necessary to send commands to the server
  console after attaching

* To access the server console run `docker attach minecraft`, after executing the
  commands detach with `CTRL-p, CTRL-q`

* Whitelist command is `/whitelist add player_name`

* Using a different world (or different carpet / datapack settings) should be as
  simple as changing the `$PWD/world` in the last command to point to directory 
  that contains the desired world

* To provide custom options to Java (for example to allocate different amount of
  RAM, or to optimize garbage collection) you can add something like
  `--env JAVA_OPTS="-Xmx8G -Xms8G"` to the last command.


## TODO:

Make a nice docker compose file to make configuration even easier
