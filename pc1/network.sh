#!/bin/sh
ip addr flush dev eth0
ip addr flush dev eth1

ip addr add 192.168.100.10/24 dev eth1
ip route add default via 192.168.100.1
