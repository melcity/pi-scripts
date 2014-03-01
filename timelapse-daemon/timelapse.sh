#!/bin/bash

# This script takes timelapse photos.
# This should be placed in /usr/local/bin
#
# Author: Chris Collins
#

# Ensure that our configuration file is available, or exit.
CONF=/etc/default/timelapse.conf
if [ ! -e $CONF ]; then
    echo "Failed to load configuration file $CONF"
    exit 1
fi
source $CONF

# Ensure we have a save dir
[ -d $SAVE_DIR ] || mkdir -p $SAVE_DIR

# Start the timelapse loop
while [ true ]; do
        filename=img-$(date -u +"%Y%m%d%H%M%S").jpg
        echo "Taking timelapse photo $SAVE_DIR/$filename"
        raspistill $RASPISTILL_ARGS -n -o $SAVE_DIR/$filename
        # Wait for next shot
        sleep $PERIOD
done


