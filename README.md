RemotePi scripts for OpenELEC 6
===============================

These are my config scripts for the [RemotePi board](http://www.msldigital.com/). Only tested with a Raspberry Pi 2 running OpenELEC 6.

Installation
------------

All 4 scripts go into the `/storage/.config` directory:

* `autostart.sh`: called by `systemd` on startup. Executes `remotepi-watcher.sh` as a background process.

* `remotepi-watcher.sh`: watches RemotePi via GPIO. When power button is pressed (or IR power-off command received) it initiates `systemd`'s poweroff sequence. 

* `shutdown.sh`: called by `systemd` on shutdown. Executes `remotepi-shutdown.sh`.

* `remotepi-shutdown.sh`: Tells RemotePi via GPIO pin to turn off the power.

Disclaimer
----------

It works on my system. Use at your own risk.