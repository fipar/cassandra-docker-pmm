FROM cassandra:latest

RUN apt-get update \
    && apt-get install -y \
    lsb-release \
    wget \

RUN wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb \
    && dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb \

RUN apt-get update \
    && apt-get install -y \
    pmm-client

ENV JVM_OPTS "$JVM_OPTS -javaagent:/usr/local/cassandra-prometheus-2.0.0-jar-with-dependencies.jar=7400"