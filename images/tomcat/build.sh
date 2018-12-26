#!/usr/bin/env bash


version="v1.0"

docker build --no-cache -t qiujiahong/tomcat:${version} .
docker tag qiujiahong/tomcat:${version} qiujiahong/tomcat:latest 
docker push  qiujiahong/tomcat:${version}
docker push  qiujiahong/tomcat:latest

# docker run qiujiahong/tomcat:v1.0 tail -f /dev/null