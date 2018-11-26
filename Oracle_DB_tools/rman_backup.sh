#!/bin/sh

### Oracle RMAN Backup Script

sid=$1

if [ -n "$sid" ]; then
    export ORACLE_SID=$sid
fi

## RMANi Backup実行

rman target / catalog rco/catalogdb@catadb <<EOF
RUN {
 RECOVER COPY OF DATABASE WITH TAG daily_job;
 BACKUP INCREMENTAL LEVEL 1 FOR RECOVER OF COPY WITH TAG daily_job DATABASE;
}
exit
EOF
