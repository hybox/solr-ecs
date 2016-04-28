FROM    solr:latest

EXPOSE 8983

ENV SOLR_HOME="/data/solr"
ENV ZOOKEEPER_HOSTS="127.0.0.1:2181"

USER root

RUN apt-get update && \
  apt-get -y install sudo && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir -p $SOLR_HOME \
  && chown -R $SOLR_USER:$SOLR_USER $SOLR_HOME
VOLUME $SOLR_HOME

ADD wrapper.sh /opt/solr/wrapper.sh

ENTRYPOINT ["/opt/solr/wrapper.sh"]
CMD [""]
