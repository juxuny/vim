#!/bin/bash
set -e
if [ -f dl.sh ]; then sh dl.sh; fi
REPOSITORY=registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim
#VERSION=go1.20-v1.7.1-$(uname | awk '{print tolower($0)}')
VERSION=v1.15.5
docker build -t ${REPOSITORY}:${VERSION} -f tabnine.dockerfile . --no-cache
echo "docker push ${REPOSITORY}:${VERSION}"
