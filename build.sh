#!/usr/bin/env bash

IMAGE_VER=3.0.4

NODE_VERS="$(ls node*.Dockerfile | grep -Po '\d+')"

set -ex -o pipefail

for NODE_VER in ${NODE_VERS}; do
    docker build -t unboundedsystems/node-testimg:${NODE_VER}-${IMAGE_VER} -f node${NODE_VER}.Dockerfile .
done


for NODE_VER in ${NODE_VERS}; do
    docker push unboundedsystems/node-testimg:${NODE_VER}-${IMAGE_VER}
done