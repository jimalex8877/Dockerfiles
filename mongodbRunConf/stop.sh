#!/usr/bin/env bash
docker kill mongodb-27017
docker kill mongodb-37017
docker kill mongodb-47017

docker rm mongodb-27017
docker rm mongodb-37017
docker rm mongodb-47017
