#!/bin/bash

# AIS Hub Data Aggregator
# https://github.com/ianrenton/aishub-data-aggregator

# Supply your own AIS Hub API username
USERNAME=

# Create aggregate file if it doesn't already exist
touch aggregate.csv

# Retrieve data
wget -q -O data.csv "http://data.aishub.net/ws.php?username=${USERNAME}&format=1&output=csv&compress=0"

# Strip header
sed -i '/"MMSI"/d' data.csv

# Find all unique MMSIs between new and aggregate data, merging them
# into a new file (preferring new data). Thanks to Stack Overflow
# users markp-fuso & Ed Morton. Multiple files are used here
# to prevent trying to do too much in memory with large files
awk -F, '!seen[$1]++' data.csv aggregate.csv > aggregate2.csv

# Sort by time
sort -t, -k2 aggregate2.csv >> aggregate3.csv

# Reset back to starting position
mv aggregate3.csv aggregate.csv
rm aggregate2.csv
