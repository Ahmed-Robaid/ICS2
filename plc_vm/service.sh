#!/bin/bash
RUN_FILE="/usr/local/bin/run_plc.sh"
SERVICE_FILE="/etc/systemd/system/plc.service"

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
