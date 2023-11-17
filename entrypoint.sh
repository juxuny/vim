#!/bin/sh
hook_dir=/hook
if [ -d $hook_dir ]; then
	for scripts in 	$hook_dir/*.sh; do
		. $scripts
	done
fi
vim "$ENTRYPOINT_ARGS" "$@"
