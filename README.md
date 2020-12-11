# Sage-Wagman-Watchdog

Creates Debian Package containing services to pet/ping the watchdog based on information in /etc/sage/config.ini. The package containing all services is ~1500B.

### Usage

To build a version of this debian package simply run the build.sh script:

```
./build.sh
```

In return, the script will return a versioned sage-wagman-watchdog debian package.
For example: `sage-wagman-watchdog_1.0.1.local-3755475_all.deb`'

### Installation

If you wanted to install this debian-package in order to ping your watchdog, simply use the dpkg -i option.

For example:

```
dpkg -i sage-wagman-watchdog_1.0.1.local-3755475_all.deb
```

Following the execution of this installation, all services and files neccessary will be placed in their correct locations and the service should be running.

To confirm, 

```
journalctl -fu sage-wagman-watchdog
```

You can observe that your watchdog should be pinged every minute from here.

If you want to confirm that the gpio pin is being pinged on your NX, from the config file on your NX change the ping time parameter to something longer, flip the NX over, grab a multimeter, wait till you see a status message saying that the pin is active and confirm the pin is active.
