#!/bin/bash
set -e
download_link() {
	url="$1"
	base_name=$(basename $url)
	if [ ! -f $base_name ]; then
		echo "not found: $base_name"
		echo "downloading: $url"
		curl -L --output $base_name $url
	fi
}

#download_link https://go.dev/dl/go1.20.8.linux-amd64.tar.gz
download_link https://go.dev/dl/go1.21.8.linux-amd64.tar.gz
#download_link https://nodejs.org/download/release/v16.20.0/node-v16.20.0-linux-x64.tar.gz
#download_link https://nodejs.org/download/release/v20.11.0/node-v20.11.0-linux-x64.tar.gz
#download_link https://nodejs.org/download/release/v20.12.0/node-v20.12.0-linux-x64.tar.gz
download_link https://nodejs.org/download/release/v21.7.0/node-v21.7.0-linux-x64.tar.gz
download_link https://github.com/clangd/clangd/releases/download/16.0.2/clangd-linux-16.0.2.zip
