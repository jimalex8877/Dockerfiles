#!/bin/sh
chown -R openresty:openresty /usr/local/openresty

exec gosu openresty "$@"
