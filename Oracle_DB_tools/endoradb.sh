#!/bin/sh

# stop Oracle DB script


ora_sid=$1

if [ -n "$ora_sid" ];
then
 export ORACLE_SID=$ora_sid
fi


# Oracle DB インスタンス停止
sqlplus " / as sysdba" <<EOS
shutdown immediate
quit
EOS

