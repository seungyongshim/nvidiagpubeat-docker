#! /bin/bash

cp ${WORKSPACE}/nvidiagpubeat.yml ${WORKSPACE}/src/github.com/ebay/nvidiagpubeat/nvidiagpubeat.yml
chmod go-w ${WORKSPACE}/src/github.com/ebay/nvidiagpubeat/nvidiagpubeat.yml

cd ${WORKSPACE}/src/github.com/ebay/nvidiagpubeat
make setup
make

./nvidiagpubeat -c nvidiagpubeat.yml -e -d "*" -E seccomp.enabled=false