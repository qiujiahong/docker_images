FROM centos:7.6.1810


COPY soft /temp/

RUN echo "==> start to install image..." && \
    echo "set time zone..."  && \
    rpm -ivh temp/jdk-8u181-linux-x64.rpm  && \
    mkdir /usr/local/tomcat && \
    cd /temp/ && \
    tar -xzvf apache-tomcat-9.0.10.tar.gz  &&\
    rm -rf apache-tomcat-9.0.10/webapps/*  &&\
    mv apache-tomcat-9.0.10/* /usr/local/tomcat/ && \
    rm -rf /temp/ && \
    echo "Install finised"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /usr/local/tomcat/

ENTRYPOINT ["./bin/catalina.sh","run"]