#!/bin/sh

#yDate=`date -d yesterday +%Y-%m-%d`
#echo $yDate

if [ "-$1" = "-" ];
then
    echo "full path of logfile must be appointed.";
    exit 0;
fi;

if [ "-$2" = "-" ];
then
    echo "lantency-topN must be appointed.";
    exit 0;
fi;

if [ "-$3" = "-" ];
then
    echo "output path must be appointed.";
    exit 0;
fi;

LOGFILE=$1
TOP_N=$2
OUTPUT_FOLDER=$3


if [ -f "$LOGFILE" ];
then 
    awk -v topN=$TOP_N -v outputFolder=$OUTPUT_FOLDER -f lantency-topN.awk.sh $LOGFILE
fi;
