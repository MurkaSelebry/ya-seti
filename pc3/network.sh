#!/bin/sh
ip addr add 192.168.100.20/24 dev eth1
ip route add default via 192.168.100.1
