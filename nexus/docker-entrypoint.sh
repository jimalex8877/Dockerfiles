#!/bin/sh -e

chown -R nexus:nexus "${NEXUS_DATA}"

exec gosu nexus "$@"