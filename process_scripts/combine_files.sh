#!/bin/bash

file1=${1}
file2=${2}
output_dir="files_dir"
output_file=${file1%_*}_combined.csv


# cd to files_dir:
cd ${output_dir}


# create a fd for file 2:
exec 6<"$file2"


while read -r line
do
    read -r f2line <&6
    echo "${line},${f2line}"
done <"$file1" > $output_file


# cd back to prvious dir:
cd - 1>/dev/null

exec 6<&-
