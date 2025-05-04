#!/usr/bin/env sh

# Check `bluetoothctl gatt.list-attributes` to find paths for `Battery Level`

MAC_ADDR=CF_C6_6E_F6_6D_0E
L_KB_PATH=service0010/char0011
R_KB_PATH=service0015/char0016

L_KB_HEX=$(gdbus call --system --dest org.bluez --object-path /org/bluez/hci0/dev_$MAC_ADDR/$L_KB_PATH --method org.bluez.GattCharacteristic1.ReadValue "{}"  | sed -E 's/.*0x([0-9a-fA-F]+).*/\1/');
R_KB_HEX=$(gdbus call --system --dest org.bluez --object-path /org/bluez/hci0/dev_$MAC_ADDR/$R_KB_PATH --method org.bluez.GattCharacteristic1.ReadValue "{}"  | sed -E 's/.*0x([0-9a-fA-F]+).*/\1/');

echo "Left: $((0x$L_KB_HEX))%; Right: $((0x$R_KB_HEX))%"
