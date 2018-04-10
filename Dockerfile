# to build:
# docker build -t fipar/cassandra-pmm:v1 .
FROM cassandra:latest

RUN apt-get update; \
    apt-get -y install lsb-release wget; \
    wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb; \
    dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb; \
    apt-get update; \
    apt-get -y install pmm-client;