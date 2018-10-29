#!/usr/bin/env bash

docker run --restart=always -d --name ideaLicenseServer \
	--expose 1027 -p 1027:1027 \
	changmingjiang/idea-license-server:latest
