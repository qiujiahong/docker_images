#!/usr/bin/env bash


##  JVM调优参数
JVM_XMS=${JVM_XMS:-2048}
JVM_XMX=${JVM_XMX:-4096}



cd /usr/local/tomcat/

export JAVA_OPTS="-Xms${JVM_XMS}M -Xmx${JVM_XMX}M \
-XX:+PrintGCDetails -XX:+PrintGCDateStamps  \
-Xloggc:/usr/local/tomcat/logs/gc.log \
-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/usr/local/tomcat/logs/a.dump"


./bin/catalina.sh run


