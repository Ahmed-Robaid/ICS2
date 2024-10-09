#!/bin/bash
RUN_FILE="/usr/local/bin/run_plc.sh"
SERVICE_FILE="/etc/systemd/system/plc.service"
iface_file="/etc/network/interfaces"

cat <<EOL > $RUN_FILE
cd ~/OpenPLC_v2
sudo /usr/bin/nodejs server.js
EOL


cat <<EOL > $SERVICE_FILE
[Unit]
Description=Start OpenPLC on Boot

[Service]
Type=simple
ExecStart=/bin/bash /usr/local/bin/run_plc.sh

[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload

# Enable the service to start on boot
systemctl enable plc.service


cat <<EOL > $iface_file
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto enp0s3
iface enp0s3 inet static
address 192.168.95.2
netmask 255.255.255.0
up route add -net 192.168.90.0 netmask 255.255.255.0 gw 192.168.95.1
EOL

systemctl restart networking.service

echo "Dont Forget !!! changing the NIC to Host_Only"

sleep 5
