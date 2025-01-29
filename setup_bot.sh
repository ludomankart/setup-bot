#!/bin/bash

chmod +x test

cp test /var/

cat <<EOF | sudo tee /etc/systemd/system/test.service > /dev/null
[Unit]
Description=test Service
After=network.target

[Service]
ExecStart=/var/test
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload

sudo systemctl start test.service

sudo systemctl enable test.service

echo "add bot"