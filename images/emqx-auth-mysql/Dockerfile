FROM emqx/emqx:v3.0.1

COPY files /tmp/

RUN echo "==> start to install" && \
    cd /tmp/ && \
    cat em.sh > emqmysql.sh && \
    chmod +x emqmysql.sh  && \   
    echo "Install finised"
    
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


EXPOSE 18083
EXPOSE 1883
EXPOSE 8083
EXPOSE 8084
EXPOSE 8883

#ENTRYPOINT ["/tmp/emqmysql.sh"]
ENTRYPOINT /tmp/emqmysql.sh
