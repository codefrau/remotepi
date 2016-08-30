#!/bin/bash

# this is the GPIO pin signaling that button was pressed
GPIO_BUTTON=14

echo "$GPIO_BUTTON" > /sys/class/gpio/export 2>/dev/null
echo "in" > /sys/class/gpio/gpio$GPIO_BUTTON/direction
while true; do
  sleep 1
  power=$(cat /sys/class/gpio/gpio$GPIO_BUTTON/value)
  if [ $power != 0 ]; then
    poweroff
  fi
done
