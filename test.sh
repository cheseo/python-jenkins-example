#!/bin/bash

flask --app main run &
pid=$!
trap 'kill -9 $pid' EXIT

out=$(curl 'http://127.0.0.1:5000/test')
if [[ $out = 'passed' ]]; then
	exit 0
fi
printf '%s\n' "expected 'passed' got: '$out'"
exit 1
