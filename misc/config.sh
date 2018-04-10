#!/bin/bash
echo
echo "All currently available interfaces"
ifconfig -a

#wlo1 is the wireless interface
echo
echo "Temporarily configuring the IP Address..."
sudo ifconfig wlo1 192.168.1.205 netmask 255.255.252.0
echo
echo "Verification of the set IP address..."
ifconfig wlo1
echo
echo "Configuring a default gateway..."
sudo route add default gw 192.168.0.8 wlo1
echo
echo "Verifying default gateway configuration..."
route -n
