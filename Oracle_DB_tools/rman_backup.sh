#!/bin/sh

### Oracle RMAN Backup Script

sid=$1

if [ -n "$sid" ]; then
    export ORACLE_SID=$sid
fi

## RMANi Backup実行

rman <<EOF
connect target /
RUN {
 RECOVER COPY OF DATABASE WITH TAG daily_job;
 BACKUP INCREMENTAL LEVEL 1 FOR RECOVER OF COPY WITH TAG daily_job DATABASE PLUS ARCHIVELOG;
}
exit
EOF

EOF
