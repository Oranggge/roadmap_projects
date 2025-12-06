#!/bin/bash


awk -F ' ' '{print $1}' "$1" | sort | uniq --count | sort -gr | head -5
