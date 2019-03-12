#!/usr/bin/env bash


version="v3.0-user"

docker build --no-cache -t qiujiahong/emqx-docker:${version} .
#docker tag qiujiahong/emqx-docker:${version}
#docker push  qiujiahong/emqx-docker:${version}
