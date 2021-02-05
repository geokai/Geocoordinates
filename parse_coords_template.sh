#!/bin/bash

file=$1
if [ -z "$file" ]; then
    echo "Usage: Provide a valid kml file." && exit
fi


folder=$2
if [ -z "$folder" ]; then
    echo "Usage: Provide a valid folder name." && exit
fi


name=$3
if [ -z "$name" ]; then
    echo "Usage: Provide a valid path name." && exit
fi


cat $file | jc --xml | jq -r ".kml.Document.Folder.Folder[] | select(.name ==
\"${folder}\").Placemark[] | select(.name == \"${name}\").LineString.coordinates" | tr ' ' '\n' | awk -F, '{print $2","$1}'
