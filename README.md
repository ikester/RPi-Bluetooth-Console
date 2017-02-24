# RPi-Bluetooth-Console

Script to setup Raspberry Pi to expose console via bluetooth.
N.B. There is no security implemented here (no pin etc...),
and the device always remains discoverable via bluetooth.
This can be turned off with bluetoothctl ("discoverable off").

To install on a network connected host run as root or sudo:
```sh
source <(curl -s https://raw.githubusercontent.com/ikester/RPi-Bluetooth-Console/master/setup.sh)
```
