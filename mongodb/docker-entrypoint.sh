#!/bin/sh
mkdir -p /opt/mongodb/data
chown -R mongodb:mongodb /opt/mongodb

exec gosu mongodb "$@"
