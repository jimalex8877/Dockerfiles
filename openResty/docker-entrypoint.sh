#!/bin/sh
chown -R openresty:openresty /opt/openresty

exec gosu openresty "$@"
