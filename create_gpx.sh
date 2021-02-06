#!/bin/bash

# this is a basic template to producing a gpx file as is required by the
# GPS Waypoint Finder App
# The info required is:
# the coordinates - latitude,longitude
# the waypoint name
# an 'Icon' number (this is optional, leave as '1' for the default)


# print once:
echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > gpx_file
echo '<gpx version="1.1" creator="GPS waypoints www.keuwl.com">' >> gpx_file
echo '<metadate></metadata>' >> gpx_file


# print in loop - iterate as many times as there are points;
# variables:
# $lat, $lon - the coordinates
# $name - the waypoint name, eg; wp01, wp02, bridge, ...etc
# $icon - the icon identifier number (refer to the app for the icons)

for each_dataset
do
    echo '<wpt lat="$lat" lon="$lon">' >> gpx_file
    echo '<name>$name</name>' >> gpx_file
    echo '<desc>Icon="$icon"</desc>' >> gpx_file
    echo '<time>2015-11-12T22:22:00Z</time>' >> gpx_file
    echo '</wpt>' >> gpx_file
done


# print once:
echo '</gpx>' >> gpx_file
