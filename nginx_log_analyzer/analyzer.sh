#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "no log file given"
    exit 1
elif [ "$#" -ge 2 ]; then
    echo "too many logs files"
    exit 1
elif [ ! -f "$1" ]; then
     echo "path should be a file not a directory!"
     exit 1
else
    echo "the log file is $1"
fi

echo "Top 5 IP addresses with the most requests:"
awk -F ' ' '{print $1}' "$1" | sort | uniq --count | sort -gr | head -5

echo "Top 5 most requested paths:"
awk -F ' ' '{print $7}' "$1" | sort | uniq --count | sort -gr | head -5

echo "Top 5 response status codes:"
awk -F ' ' '{print $9}' "$1" | sort | uniq --count | sort -gr | head -5

# to analyze "-" response status following command can be used:
# awk '{if ($9 ~ "-") print $0 }' nginx-access.log
