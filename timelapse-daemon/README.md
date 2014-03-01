Timelapse-Daemon
================
Author: Chris Collins 

These scripts allow you to use your Raspberry Pi for time lapse photography.

timelapse-daemon
================
timelapse-daemon is an init script that allows starting and stopping the time 
lapse photography service (daemon).  This can be used to start the time lapse
service when the Raspberry Pi starts, and gracefully stops the service when the 
Raspberry Pi is shutting down.

To enable this script to run at system startup, do the following:
    1. Copy timelapse-daemon to /etc/init.d/
    2. Copy timelapse.conf to /etc/default/
    3. Copy timelapse.sh to /usr/local/bin
    4. Ensure timelapse.sh has the correct permissions:
        'sudo chmod 755 /usr/local/bin/timelapse.sh'
    5. Register the service:
        'sudo update-rc.d timelapse-daemon defaults'
    
This script can be controlled in the same way as other system services.
Start the service by:           'sudo service timelapse-daemon start'
Stop the service by:            'sudo service timelapse-daemon stop'
Restart the service by:         'sudo service timelapse-daemon restart'
Monitor the service by:         'sudo service timelapse-daemon status'
Reload the configuration by:    'sudo service timelapse-daemon reload'

timelapse.conf
==============
timelapse.conf is the configuration file for the timelapse photography service.
This should be placed in /etc/default/

This file can be edited to change settings such as the location for image files,
time lapse period and passing arguments to the raspistill utility which takes
the photos.

timelapse.sh
============
This script executed raspistill to take the time lapse photos, and waits a 
period between images.  This file should be placed in /usr/local/bin and given 
execute permission.
