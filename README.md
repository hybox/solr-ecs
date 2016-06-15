# solr-ecs

This project extends the official Solr docker image to run SolrCloud on Amazon Web Services' [EC2 Container Service](http://aws.amazon.com/ecs/).

## Changes to the upstream image

- Run Solr instances in SolrCloud mode, connecting to the Zookeeper ensemble identified by the `$ZOOKEEPER_HOSTS` environment variable.
- Retrieve the public IP for the ECS container using the AWS EC2 metadata API, enabling Solr replication across hosts
- Add `placement` metadata for Solr's [Rule-based Replica Placement](https://cwiki.apache.org/confluence/display/solr/Rule-based+Replica+Placement), enabling collection replication across AWS Availability Zones. 
