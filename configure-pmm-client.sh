#!/bin/bash
# TODO: this should go into a custom entrypoint file

apt-get update
apt-get install -y lsb-release wget

wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb
dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb

apt-get update
apt-get install -y pmm-client

pmm-admin config --server pmm-server
pmm-admin add external:service --service-port=7400 cassandra_$(hostname)