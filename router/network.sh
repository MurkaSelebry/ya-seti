#!/bin/sh

#без бриджа, но с сеткой 32

sysctl -w net.ipv4.conf.all.proxy_arp=1
sysctl -w net.ipv4.conf.default.proxy_arp=1
sysctl -w net.ipv4.conf.eth1.proxy_arp=1
sysctl -w net.ipv4.conf.eth2.proxy_arp=1
sysctl -w net.ipv4.conf.eth3.proxy_arp=1
sysctl -w net.ipv4.conf.eth4.proxy_arp=1

ip link set dev eth1 up
ip link set dev eth2 up
ip link set dev eth3 up
ip link set dev eth4 up

ip addr add 192.168.100.1/32 dev lo
ip addr add 172.16.100.1/32 dev lo

ip route add 192.168.100.10/32 dev eth1
ip route add 192.168.100.20/32 dev eth2
ip route add 172.16.100.10/32 dev eth3
ip route add 172.16.100.20/32 dev eth4
