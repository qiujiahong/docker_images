FROM centos:7.6.1810


COPY files /temp/

RUN echo "==> start to install image..." && \
    echo "set time zone..."  && \
    rpm -ivh /temp/soft/jdk-8u181-linux-x64.rpm  && \
    mkdir /usr/local/tomcat && \
    cd /temp/soft/ && \
    tar -xzvf apache-tomcat-9.0.10.tar.gz  &&\
    rm -rf apache-tomcat-9.0.10/webapps/*  &&\
    mv apache-tomcat-9.0.10/* /usr/local/tomcat/ && \
    cd /usr/local/tomcat/ && \
    echo "set start script..."  && \
    cp /temp/script/start.sh /usr/local/tomcat/bin/ && \
    cd /usr/local/tomcat/bin/ && \
    chmod +x start.sh  && \
    echo "clear files..." && \
    rm -rf /temp/ && \
    echo "Install finised"
    
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV JAVA_HOME=/usr/java/jdk1.8.0_181-amd64
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$PATH


EXPOSE 8080

WORKDIR /usr/local/tomcat/

ENTRYPOINT ["./bin/start.sh"]