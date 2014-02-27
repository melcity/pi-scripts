#!/bin/bash
# To take timelapse photos
USER=picam
SAVEDIR=/home/$USER/images

while [ true ]; do
	filename=tl-$(date -u +"%Y%m%d%H%M%S").jpg
	echo "Shooting $filename"
	raspistill -n -o $SAVEDIR/$filename
	# sleep for 10 seconds
	sleep 10
done


