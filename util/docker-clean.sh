#!/usr/bin/env bash

docker rm $(docker ps -a -q) -f
docker volume rm $(docker volume ls -qf dangling=true)