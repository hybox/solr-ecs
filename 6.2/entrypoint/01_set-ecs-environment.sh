#!/bin/bash
set -e

echo ': ${ECS_PUBLIC_PORT:="80"}' >> /opt/solr/bin/solr.in.sh
echo ': ${ECS_PUBLIC_HOST:=`wget -qO- http://169.254.169.254/latest/meta-data/hostname`}' >> /opt/solr/bin/solr.in.sh
echo ': ${ECS_PLACEMENT:=`wget -qO- http://169.254.169.254/latest/placement/availability-zone`}' >> /opt/solr/bin/solr.in.sh

echo 'SOLR_HOST=$ECS_PUBLIC_HOST' >> /opt/solr/bin/solr.in.sh
echo 'SOLR_OPTS="$SOLR_OPTS -DhostPort=$ECS_PUBLIC_PORT -Dplacement=$ECS_PLACEMENT"' >> /opt/solr/bin/solr.in.sh
echo 'SOLR_MODE="solrcloud"' >> /opt/solr/bin/solr.in.sh

sed -i -e 's/SOLR_HEAP=".*"/SOLR_HEAP="2g"/' /opt/solr/bin/solr.in.sh
