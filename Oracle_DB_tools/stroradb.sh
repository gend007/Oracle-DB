#!/bin/sh

# start Oracle DB script


ora_sid=$1

if [ -n "$ora_sid" ];
then
 export ORACLE_SID=$ora_sid
fi


# リスナー起動
lsnrctl start

# Oracle DB インスタンス起動
sqlplus " / as sysdba" <<EOS
startup
quit
EOS

# Oracle DB インスタンス起動
sqlplus " / as sysdba" <<EOS
startup
quit
EOS
