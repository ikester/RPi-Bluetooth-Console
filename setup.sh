#!/bin/bash -e

echo Script for Linux raspberrypi Hypriot 1.2.1

sudo sed -i: 's|^Exec.*toothd$| \
ExecStart=/usr/lib/bluetooth/bluetoothd -C --noplugin=sap \
ExecStartPost=/usr/bin/sdptool add SP \
|g' /lib/systemd/system/bluetooth.service

sudo cat <<EOF | sudo tee /etc/systemd/system/rfcomm.service > /dev/null
[Unit]
Description=RFCOMM service
After=bluetooth.service
Requires=bluetooth.service
 
[Service]
ExecStart=/usr/bin/rfcomm watch hci0 1 getty rfcomm0 115200 vt100
 
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable rfcomm

echo Pair and "screen /dev/cu.<hostname>-SerialPort 115200"
