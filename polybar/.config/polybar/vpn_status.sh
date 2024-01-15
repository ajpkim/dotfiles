#!/bin/bash

STATUS=$(mullvad status)

if [[ $STATUS == *"Connected"* ]]; then
    # For the actual connection info: $(echo $STATUS | cut -d ' ' -f 3-)"
    echo "VPN "
else
    echo "VPN "
fi
