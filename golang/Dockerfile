FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ARG GOLANG_VERSION=$GOLANG_VERSION
ARG GOLANG_SHA256=$GOLANG_SHA256

ENV GOPATH=/go \
	PATH=/go/bin:/usr/local/go/bin:$PATH

# https://github.com/docker-library/golang/blob/master/1.14/buster/Dockerfile

RUN set -ex; \
	\
	apt-get update && apt-get install -y --no-install-recommends \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
	; \
	wget --progress=dot:giga -O go.tgz "https://studygolang.com/dl/golang/go$GOLANG_VERSION.linux-amd64.tar.gz"; \
	echo "${GOLANG_SHA256} *go.tgz" | sha256sum -c -; \
	tar -C /usr/local -xzf go.tgz; \
	rm -rf go.tgz /var/lib/apt/lists/*; \
	\
	mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"; \
	go version

WORKDIR $GOPATH