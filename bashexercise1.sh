#! /bin/bash
CT=$(date -u +%H)
URL="http://tgftp.nws.noaa.gov/data/observations/metar/cycles/"$CT"Z.TXT"
DIR=~/Documents/

wget $URL -O $CT"Z.TXT" -P $DIR
