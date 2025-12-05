#!/bin/bash


if [ "$#" -lt 1 ]; then
	echo "no path given"
	exit 1
elif [ "$#" -ge 2 ]; then
	echo "too many paths, plese enter only one, like:"
	echo "./log-arhive.sh /var/log"
	exit 1
elif [ -f "$1" ]; then
     echo "path should be a diretory not a file!"
     exit 1
elif [ ! -d "$1" ]; then
     echo "$1 path does not exists"
else
	echo "the path to archive is $1"
fi

echo "creating an archive..."
fname="$(date +"%Y%m%d_%H%M%S")"
if  tar -czvf "./logs_archive_$fname.tar.gz" "$1"; then
	echo "successfull archived"
	exit 0
else 
	echo "there was a problem with arhiving"
	echo "deleting unfully archive"
	rm -f "./logs_archive_$fname.tar.gz"
	echo "exiting the program with 1 error code" >&2
	exit 1
fi

