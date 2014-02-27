#!/bin/bash
#
# Takes timelapse photos using raspistill
# Author: Chris Collins
#

# Ensure that our configuration file is available, or exit.
CONF=/etc/default/timelapse.conf
[ -e $CONF ] && exit 1
source $CONF

# Ensure we have a save dir
[ -d $SAVE_DIR ] || mkdir -p $SAVE_DIR

# Start the timelapse loop
while [ true ]; do
	filename=tl-$(date -u +"%Y%m%d%H%M%S").jpg
	raspistill -n -o $SAVE_DIR/$filename
	# Wait for next shot
	sleep $PERIOD
done

