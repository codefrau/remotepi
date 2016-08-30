#!/bin/sh
# this script is called by systemd from 
# kodi-halt.service, kodi-poweroff.service, and kodi-reboot.service
# with "halt", "poweroff", or "reboot" in $1

exec /storage/.config/remotepi-shutdown.sh $1
