#!/bin/sh

URL=$2
PORT=$3

echo $URL,$PORT

curl -Is http://$URL:$PORT/info.php > /dev/null && echo "The remote side is healthy" || echo "The remote side is failed, please check"
