#!/bin/bash
set -e
file dl.sh && ./dl.sh
REPOSITORY=registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim
VERSION=go1.20-v1.7.1-$(uname | awk '{print tolower($0)}')
docker build -t ${REPOSITORY}:${VERSION} -f tabnine.dockerfile . --no-cache
echo "docker push ${REPOSITORY}:${VERSION}"
