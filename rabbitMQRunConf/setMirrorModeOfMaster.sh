#!/usr/bin/env bash
docker exec -it rabbitmq bash
rabbitmqctl set_policy ha-all ".*" '{"ha-mode":"all"}'