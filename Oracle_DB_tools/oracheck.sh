#!/bin/sh

# Oracle DB process check

ora_sid=$1

if [ -z "$ora_sid" ]; then
    ora_sid=$ORACLE_SID
fi

#count=`ps -ef | grep $ora_sid | grep -v grep | wc -l`
count=`ps cax | grep $ora_sid | wc -l`
if [ $count = 0 ]; then
    echo "The process is dead."
else
    echo "The process is alive."
fi
