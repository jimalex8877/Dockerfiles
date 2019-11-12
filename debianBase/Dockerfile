FROM debian:buster-slim

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV LANG=zh_CN.UTF-8 \
	LC_ALL=zh_CN.UTF-8 \
	LANGUAGE=zh_CN.UTF-8

RUN set -ex; \
	\
	#echo "deb http://mirrors.aliyun.com/debian/ buster main non-free contrib" > /etc/apt/sources.list; \
	#echo "deb http://mirrors.aliyun.com/debian-security buster/updates main" >> /etc/apt/sources.list; \
	#echo "deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib" >> /etc/apt/sources.list; \
	#echo "deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib" >> /etc/apt/sources.list; \
	\
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free" > /etc/apt/sources.list; \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list; \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free" >> /etc/apt/sources.list; \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list; \
	\
	apt update && apt install -y locales wget curl gnupg gosu; \
	echo $LANG > /usr/share/locale/locale.alias; \
	localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias $LANG; \
	echo "Asia/Shanghai" > /etc/timezone && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
	\
	rm -rf /var/lib/apt/lists/*
