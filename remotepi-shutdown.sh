#!/bin/bash

# this is the GPIO pin triggering the power button
GPIO_TRIGGER=15

# this is the GPIO pin signaling that shutdown is done
GPIO_DONE=14

trigger_power_button () {
  echo "$GPIO_TRIGGER" > /sys/class/gpio/export
  echo "out" > /sys/class/gpio/gpio$GPIO_TRIGGER/direction
  echo "1" > /sys/class/gpio/gpio$GPIO_TRIGGER/value
  usleep 125000
  echo "0" > /sys/class/gpio/gpio$GPIO_TRIGGER/value
  usleep 200000
  echo "1" > /sys/class/gpio/gpio$GPIO_TRIGGER/value
  usleep 400000
  echo "0" > /sys/class/gpio/gpio$GPIO_TRIGGER/value

  echo "$GPIO_DONE" > /sys/class/gpio/export
  echo "out" > /sys/class/gpio/gpio$GPIO_DONE/direction
  echo "1" > /sys/class/gpio/gpio$GPIO_DONE/value

  usleep 200000
}


if [ "$1" != "reboot" ]; then
    trigger_power_button
fi
