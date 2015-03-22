#!/bin/bash

set -e

./build versions/library-3.1/options
docker build -t mazzolino/armhf-alpine:3.1 versions/library-3.1

./build test versions/library-3.1/options

docker tag mazzolino/armhf-alpine:3.1 mazzolino/armhf-alpine:latest

docker push mazzolino/armhf-alpine

docker tag -f mazzolino/armhf-alpine:3.1 alpine:3.1
docker tag -f mazzolino/armhf-alpine:latest alpine:latest
