#!/usr/bin/env bash
docker exec -it rabbitmq bash
gosu rabbitmq rabbitmqctl set_policy ha-all ".*" '{"ha-mode":"all"}'