#!/bin/bash
set -e

cp -n /opt/solr/server/solr/solr.xml $SOLR_HOME
cp -n /opt/solr/server/solr/zoo.cfg $SOLR_HOME