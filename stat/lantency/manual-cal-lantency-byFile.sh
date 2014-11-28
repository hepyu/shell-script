#command example:
#sh manual-cal-lantency-byFile.sh /data/logs/userspace/user-space-request.log.2014-01-01-00.log 6 

LOGFILE=$1
TOP_N=$2
PWD_PATH=`pwd`"/"

if [ ! -f $LOGFILE ];
then
    echo "file not exist: $LOGFILE";
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
sh cal-lantency-topN-byFile.sh $LOGFILE $TOP_N $PWD_PATH
