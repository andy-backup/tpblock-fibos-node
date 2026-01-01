#!/usr/bin/env sh
CMD=$1
shift

case "$CMD" in
	"node" )
	exec fibos ./index.js
	;;

	* )
	exec $CMD "$@"
	;;
esac