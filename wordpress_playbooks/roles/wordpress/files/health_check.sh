#!/bin/sh

URL=$1
PORT=$2

curl -Is http://$URL:$PORT/info.php > /dev/null && echo "The remote side is healthy" || echo "The remote side is failed, please check"
