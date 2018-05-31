#!/usr/bin/env bash
docker kill mongodb-27017
docker kill mongodb-27018
docker kill mongodb-27019

docker rm mongodb-27017
docker rm mongodb-27018
docker rm mongodb-27019
