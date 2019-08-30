FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV GOPATH=/go \
	PATH=/go/bin:/usr/local/go/bin:$PATH

# https://github.com/docker-library/golang

RUN set -ex; \
	\
	GOLANG_VERSION=1.12.9; \
	GOLANG_SHA256=ac2a6efcc1f5ec8bdc0db0a988bb1d301d64b6d61b7e8d9e42f662fbb75a2b9b; \
	\
	apt-get update && apt-get install -y --no-install-recommends \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
	; \
	wget -c -q -O go.tgz "https://studygolang.com/dl/golang/go$GOLANG_VERSION.linux-amd64.tar.gz"; \
	echo "${GOLANG_SHA256} *go.tgz" | sha256sum -c -; \
	tar -C /usr/local -xzf go.tgz; \
	rm -rf go.tgz /var/lib/apt/lists/*; \
	\
	mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"; \
	go version

WORKDIR $GOPATH