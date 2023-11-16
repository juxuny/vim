#!/bin/sh
hook_dir=./hook
if [ -d ./hook ]; then
	for scripts in 	$hook_dir/*.sh; do
		echo $scripts
	done
fi
vim "$@"
