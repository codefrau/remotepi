#!/bin/bash

# this is the GPIO pin receiving the shut-down signal
GPIOpin1=14

cut_the_power () {
    echo "$GPIOpin1" > /sys/class/gpio/export 2>/dev/null
    echo "out" > /sys/class/gpio/gpio$GPIOpin1/direction
    echo "1" > /sys/class/gpio/gpio$GPIOpin1/value
}

case "$1" in
  halt)
    # ignore
    ;;
  poweroff)
    # turn of power via RemotePi
    cut_the_power
    ;;
  reboot)
    # ignore
    ;;
  *)
    # ignore
    ;;
esac
