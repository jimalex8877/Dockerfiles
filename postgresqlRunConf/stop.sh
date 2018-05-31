#!/usr/bin/env bash
docker kill postgres-5432
docker rm postgres-5432

docker kill postgres-5433
docker rm postgres-5433
