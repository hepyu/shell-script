#command example:
#sh manual-cal-lantency-byDay.sh /data/logs/userspace/user-space-request.log 2014-01-01 8
#notice:
#the format of logfile name should be like 'user-space-request.log.2014-01-01-00.log', to be hour,notice the date format during the file name.

LOGFILE_PREFIX=$1
DAY=$2
TOP_N=$3
PWD_PATH=`pwd`"/"

if [ $LOGFILE_PREFIX = '-'  ];
then
    echo "LOGFILE_PREFIX must be appointed.";
    exit 0;
fi;

if [ $DAY = '-' ];
then
    echo "Day must be appointed.";
    exit 0;
fi;

if [[ $TOP_N =~ ^[0-9]+$ ]]
then
    echo "TOP_N is valid.";
else
    echo "invalid TOP_N.";
    exit 0;
fi

cd $PWD_PATH"base_code"

sh cal-lantency-topN-byDay.sh $LOGFILE_PREFIX $DAY $TOP_N $PWD_PATH
