#!/bin/bash
set -e
if [ -f dl.sh ]; then sh dl.sh; fi
REPOSITORY=registry.cn-shenzhen.aliyuncs.com/juxuny-public/vim
VERSION=$(git rev-parse --abbrev-ref HEAD)
docker build -t ${REPOSITORY}:${VERSION} -f tabnine.dockerfile . --no-cache
echo "docker push ${REPOSITORY}:${VERSION}"
