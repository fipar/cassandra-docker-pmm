# cassandra-docker-pmm
Dockerfile with Cassandra and pmm-client

`docker-compose up -d`

On the Cassandra nodes:

`/usr/local/bin/configure-pmm-client.sh`

In Grafana, choose the Advanced Data Exploration tab from the upper left.

Import a good dashboard into Grafana from here:

https://github.com/fipar/docker-cassandra-prometheus/blob/master/cassandra_rev3.json