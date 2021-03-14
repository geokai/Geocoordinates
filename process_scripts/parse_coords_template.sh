#!/bin/bash


# save files to temp folder:
save_dir="files_dir"


# name of google earth xml (kml) file:
# file=$1
file="$HOME/.googleearth/myplaces.kml"
if [ -z "$file" ]; then
    echo "Usage: Provide a valid kml file." && exit
fi


# name of google earth folder containing path:
# folder=$2
folder="paths"
if [ -z "$folder" ]; then
    echo "Usage: Provide a valid folder name." && exit
fi


# name of path to parse:
name=$1
if [ -z "$name" ]; then
    echo "Usage: Provide a valid path name." && exit
fi


cat $file | jc --xml | jq -r \
    ".kml.Document.Folder.Folder[] | select(.name == \"${folder}\").Placemark[] | \
    select(.name == \"${name}\").LineString.coordinates" | tr ' ' '\n' | \
    awk -F, '{print $2","$1}' > "${save_dir}/${name}_coords"
