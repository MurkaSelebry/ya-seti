#!/bin/sh

#через бриджы

ip link add name br192 type bridge

ip link set dev eth1 master br192
ip link set dev eth2 master br192

ip addr add 192.168.100.1/24 dev br192

ip link set dev br192 up
ip link set dev eth1 up
ip link set dev eth2 up


ip link add name br172 type bridge

ip link set dev eth3 master br172
ip link set dev eth4 master br172

ip addr add 172.16.100.1/24 dev br172

ip link set dev br172 up
ip link set dev eth3 up
ip link set dev eth4 up
