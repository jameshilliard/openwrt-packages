#!/bin/sh

if [ "$1" == "set" ] && [ "$#" == "4" ]; then
  uci delete network.wwan
  uci commit wireless

  uci set network.wwan=interface
  uci set network.wwan.proto=dhcp
  uci commit wireless

  uci delete wireless.@wifi-iface[0]
  uci commit wireless

  uci set wireless.@wifi-device[0].disabled=0
  uci add wireless wifi-iface   > /dev/null 2>&1
  uci set wireless.@wifi-iface[0].device='radio0'
  uci set wireless.@wifi-iface[0].network='wwan'
  uci set wireless.@wifi-iface[0].mode='sta'

  #none for an open network, 
  #wep for WEP, 
  #psk for WPA-PSK, or 
  #psk2

  uci set wireless.@wifi-iface[0].ssid=$2
  uci set wireless.@wifi-iface[0].key=$3
  uci set wireless.@wifi-iface[0].encryption=$4

  uci commit wireless
  wifi up            > /dev/null 2>&1
  udhcpc -i wlan0 -b > /dev/null 2>&1
  
  ifconfig wlan0 | grep "inet addr"

  exit 0
fi


if [ "$1" == "get" ]; then
  ifconfig -a | grep wlan0 > /dev/null 2>&1

  if [ "$?" != "0" ]; then
    iw phy phy0 interface add wlan0 type station
    ifconfig wlan0 up
    sleep 1
  fi
  
  /opt/m1-wireless.lua

  exit 0
fi

if [ "$1" == "status" ]; then
  sleep 1
  IP=`ifconfig wlan0 2>/dev/null | grep "inet addr" | \
      sed -e 's/^ *//g' | cut -d":" -f2 | cut -d" " -f1` 
  if [ "$?" != 0 ] || [ "${IP}" == "" ]; then
    echo "Disconnected"
    echo "0.0.0.0"
    exit 1
  fi
  
  ESSID=`iwconfig wlan0 2>/dev/null | grep ESSID | cut -d":" -f 2 | sed -e 's/\"//g'`
  
  echo "${ESSID}"
  echo "${IP}"

  exit 0
fi

echo "Usage: $0 [get/set/status] PARAMS..."
exit 1
