#!/bin/bash

# this is the GPIO pin receiving the shut-down signal
GPIOpin1=14

echo "$GPIOpin1" > /sys/class/gpio/export 2>/dev/null
echo "in" > /sys/class/gpio/gpio$GPIOpin1/direction
while true; do
  sleep 1
  power=$(cat /sys/class/gpio/gpio$GPIOpin1/value)
  if [ $power != 0 ]; then
    poweroff
  fi
done
