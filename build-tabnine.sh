#!/bin/bash

if [ ! -f node-v16.20.0-linux-x64.tar.gz ]; then
	wget https://nodejs.org/download/release/v16.20.0/node-v16.20.0-linux-x64.tar.gz
fi

if [ ! -f go1.18.10.linux-amd64.tar.gz ]; then
	wget https://go.dev/dl/go1.18.10.linux-amd64.tar.gz
fi
docker build -t registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim:v1.5.0 -f tabnine.dockerfile .
