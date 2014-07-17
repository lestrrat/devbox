#!/bin/sh

boot2docker init
boot2docker start
DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
docker build -t devbox .