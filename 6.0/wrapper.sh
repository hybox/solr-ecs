#!/bin/bash

: ${PUBLIC_PORT:="80"}
: ${PUBLIC_HOST:=`wget -qO- http://169.254.169.254/latest/meta-data/hostname`}
: ${PLACEMENT:=`wget -qO- http://169.254.169.254/latest/placement/availability-zone`}

chown -R $SOLR_USER:$SOLR_USER $SOLR_HOME
cp -n /opt/solr/server/solr/solr.xml $SOLR_HOME

sudo -E -u $SOLR_USER /opt/solr/bin/solr start -f -h $PUBLIC_HOST -c -z $ZOOKEEPER_HOSTS -s $SOLR_HOME -a "-DhostPort=$PUBLIC_PORT -Dplacement=$PLACEMENT"$@
