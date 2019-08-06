#!/usr/bin/env bash

docker run --restart=always --net=host -d --name openresty \
  \
  changmingjiang/openresty:latest