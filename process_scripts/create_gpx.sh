#!/bin/bash


# file1=$1
# file2=$2
input_file=${1}
output_dir="files_dir"
output_file=${input_file%_*}.gpx


# cd to files_dir:
cd ${output_dir}


# print once:
echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > $output_file
echo '<gpx version="1.1" creator="GPS waypoints www.keuwl.com">' >> $output_file
echo '<metadate></metadata>' >> $output_file


# exec 6<&"$file2"


# print in loop - iterate as many times as there are points;
# variables:
# $lat, $lon - the coordinates
# $name - the waypoint name, eg; wp01, wp02, bridge, ...etc
# $icon - the icon identifier number (refer to the app for the icons - default=1)
while read -r f1line
do
    # read -r f2line <&6
    lat="$(echo ${f1line} | awk -F, '{print $1}')"
    lon="$(echo ${f1line} | awk -F, '{print $2}')"
    name="$(echo ${f1line} | awk -F, '{print $3}')"
    icon="$(echo ${f1line} | awk -F, '{print $4}')"
    echo "<wpt lat=\"${lat}\" lon=\"${lon}\">" >> $output_file
    echo "<name>${name}</name>" >> $output_file
    echo "<desc>Icon=\"${icon:-1}\"</desc>" >> $output_file
    echo "<time>2015-11-12T22:22:00Z</time>" >> $output_file
    echo "</wpt>" >> $output_file
done <"$input_file"


# print once:
echo "</gpx>" >> $output_file


# cd back to prvious dir:
cd - 1>/dev/null

# exec 6<&-
