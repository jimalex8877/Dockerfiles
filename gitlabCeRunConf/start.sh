#!/usr/bin/env bash
sudo docker run -d --restart always --name gitlab \
	-p 80:80 -p 23:22 \
	--hostname gitlab.changming.cn \
	-v `pwd`/data/config:/etc/gitlab \
	-v `pwd`/data/logs:/var/log/gitlab \
	-v `pwd`/data/data:/var/opt/gitlab \
	gitlab/gitlab-ce:latest