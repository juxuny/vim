#!/bin/bash
set -e
src_dir=/open-source
function download_gcc_source() {
	version="$1"
	if [ ! -d "${src_dir}" ]; then mkdir ${src_dir}; fi
	if [ ! -f ${src_dir}/gcc-${version}.tar.gz ]; then
		curl -L https://bigsearcher.com/mirrors/gcc/releases/gcc-${version}/gcc-${version}.tar.gz --output ${src_dir}/gcc-${version}.tar.gz
	fi
}

function compile_and_install() {
	version="$1"
	cd ${src_dir}
	tar xvzf gcc-${version}.tar.gz
	cd gcc-${version}
	./configure
	make && make install 
	cd - && rm -rf gcc-${version}
}

download_gcc_source 10.5.0
download_gcc_source 11.4.0
download_gcc_source 12.3.0
download_gcc_source 13.2.0

apt-get update && apt-get install -y libmpc-dev libgmp-dev libmpfr-dev gcc-multilib

compile_and_install 10.5.0
compile_and_install 11.4.0
compile_and_install 12.3.0
compile_and_install 13.2.0
