#!/usr/bin/env bash
docker build consul/ --build-arg "HTTPS_PROXY=http://10.2.236.176:1087" -t changmingjiang/consul:latest