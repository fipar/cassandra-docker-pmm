# to build:
# docker build -t fipar/cassandra-pmm:v1 .
FROM cassandra:latest

RUN apt-get update; \
    apt-get -y install lsb-release wget; \
    wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb; \
    dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb; \
    apt-get update; \
    apt-get -y install pmm-client;

COPY cassandra-prometheus-2.0.0-jar-with-dependencies.jar /usr/local
COPY configure-pmm-client.sh /usr/local/bin 

ENV JVM_OPTS "$JVM_OPTS -javaagent:/usr/local/cassandra-prometheus-2.0.0-jar-with-dependencies.jar=7400"
