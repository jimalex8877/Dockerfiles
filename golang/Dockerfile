FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV GOPATH=/go \
	PATH=/go/bin:/usr/local/go/bin:$PATH

# https://github.com/docker-library/golang/blob/master/1.13/buster/Dockerfile

RUN set -ex; \
	\
	GOLANG_VERSION=1.13.4; \
	GOLANG_SHA256=692d17071736f74be04a72a06dab9cac1cd759377bd85316e52b2227604c004c; \
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