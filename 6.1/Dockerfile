FROM solr:6.1.0

EXPOSE 8983

ENV SOLR_HOME="/data/solr"

VOLUME ["/data/solr"]

COPY entrypoint/* /docker-entrypoint-initdb.d/
