#!/bin/bash
ip addr add 192.168.100.1/24 dev eth1
ip addr add 192.168.100.1/24 dev eth2
ip addr add 172.16.100.1/24 dev eth3
ip addr add 172.16.100.1/24 dev eth4
systemctl -w net.ipv4.ip_forward=1
