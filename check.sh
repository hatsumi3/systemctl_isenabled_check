#!/usr/bin/env bash

# set -e

echo '' > out.csv

while read line
do
    column1=`echo ${line} | cut -d , -f 1`
    if [ ${column1} = "service" ]; then
        continue
    fi
    result=`sudo systemctl is-enabled ${column1} 2>&1`
    echo ${column1},${result} >> out.csv
done < list.csv