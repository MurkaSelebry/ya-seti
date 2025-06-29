#!/bin/sh
ip addr add 172.16.100.20/24 dev eth1
ip route add default via 172.16.100.1
