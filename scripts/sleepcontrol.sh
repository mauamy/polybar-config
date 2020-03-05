#!/bin/bash

state() {
  if [ $delay -gt 0 ]; then
    echo "on"
  else
    echo "off"
  fi
}

delay=$(gsettings get org.gnome.desktop.session idle-delay | awk '{print $2}')

if [ "$1" == "toggle"]; then
  
elif [ "$1" == "state"]; then
  state
fi

