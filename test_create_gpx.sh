#!/bin/bash

# this is a basic template to producing a gpx file as is required by the
# GPS Waypoint Finder App
# The info required is:
# the coordinates - latitude,longitude
# the waypoint name
# an 'Icon' number (this is optional, leave as '1' for the default)


input_file=${1}
output_file=${input_file%%\.*}.gpx
echo $output_file
echo

name="wp1_BronzeMound"
lat=51.563084
lon=-0.16369446
icon=


# print once:
echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > $output_file
echo '<gpx version="1.1" creator="GPS waypoints www.keuwl.com">' >> $output_file
echo '<metadate></metadata>' >> $output_file


# print in loop - iterate as many times as there are points;
# variables:
# $lat, $lon - the coordinates
# $name - the waypoint name, eg; wp01, wp02, bridge, ...etc
# $icon - the icon identifier number (refer to the app for the icons)

for each_dataset
do
    echo "<wpt lat=\"${lat}\" lon=\"${lon}\">" >> $output_file
    echo "<name>${name}</name>" >> $output_file
    echo "<desc>Icon=\"${icon:-1}\"</desc>" >> $output_file
    echo "<time>2015-11-12T22:22:00Z</time>" >> $output_file
    echo "</wpt>" >> $output_file
done


# print once:
echo "</gpx>" >> $output_file
