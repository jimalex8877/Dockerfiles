#!/usr/bin/env bash
docker run -it --rm --name clickeggs-server \
	-v ~/ideaProjects/clickeggs-server/:/usr/src/clickeggs-server \
	-w /usr/src/clickeggs-server/clickeggs-smart \
	docker.gf.com.cn/clickeggs/maven:3.6.0 \
	bash
