#!/bin/sh
hook_dir=./hook
if [ -d ./hook ]; then
	for scripts in 	$hook_dir/*.sh; do
		source $scripts
	done
fi
vim "$ENTRYPOINT_ARGS" "$@"
