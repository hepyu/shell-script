#command example:
#sh cal-lantency-topN-byDay.sh /data/logs/userspace/user-space-request.log 2014-01-01 10 /home/hepengyuan/shell-script/stat/lantency/base_code/

#!/bin/sh

#yDate=`date -d yesterday +%Y-%m-%d`
#echo $yDate

if [ "-$1" = "-" ];
then
    echo "logfilePrefix must be appointed.";
    exit 0;
fi;

if [ "-$2" = "-" ];
then
    echo "date must be appointed.";
fi;

if [ "-$3" = "-" ];
then
    echo "lantency-topN must be appointed.";
    exit 0;
fi;

if [ "-$4" = "-" ];
then
    echo "output path must be appointed.";
    exit 0;
fi;

S_DAY=$2
FILE_PREFIX=$1"."$S_DAY"-"
FILE_SUFFIX=".log";
TOP_N=$3
OUTPUT_FOLDER=$4

for((i=0;i<=23;i++))
do
    if [ $i -lt 10 ];
    then
        hour="0"$i;
    else
        hour=$i;
    fi;

    logfileFullPath=$FILE_PREFIX$hour$FILE_SUFFIX
    if [ -f "$logfileFullPath" ]; 
    then 
        awk -v topN=$TOP_N -v outputFolder=$OUTPUT_FOLDER -f lantency-topN.awk.sh $logfileFullPath
    fi;
done;
