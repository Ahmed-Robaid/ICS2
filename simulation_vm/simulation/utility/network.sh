#!/bin/bash

interface_file="/etc/network/interfaces"

cat <<EOL > $interface_file
auto lo
iface lo inet loopback

auto enp0s3:0
iface enp0s3:0 inet static
address 192.168.95.10
netmask 255.255.255.0
gateway 192.168.95.1

auto enp0s3:1
iface enp0s3:1 inet static
address 192.168.95.11
netmask 255.255.255.0

auto enp0s3:2
iface enp0s3:2 inet static
address 192.168.95.12
netmask 255.255.255.0

auto enp0s3:3
iface enp0s3:3 inet static
address 192.168.95.13
netmask 255.255.255.0

auto enp0s3:4
iface enp0s3:4 inet static
address 192.168.95.14
netmask 255.255.255.0

auto enp0s3:5
iface enp0s3:5 inet static
address 192.168.95.15
netmask 255.255.255.0

EOL

systemctl restart networking.service
