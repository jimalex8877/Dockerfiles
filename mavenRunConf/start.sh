#!/usr/bin/env bash
docker run -it --rm --name maven \
	-e MAVEN_ADMIN_PASSWORD="admin123" \
	changmingjiang/maven:latest \
	bash
