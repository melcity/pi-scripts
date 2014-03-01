#!/bin/bash
# Copyright 2014 Chris Collins
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# This script takes timelapse photos.
# This should be placed in /usr/local/bin

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
        raspistill -n -o $SAVE_DIR/$filename
        # Wait for next shot
        sleep $PERIOD
done


