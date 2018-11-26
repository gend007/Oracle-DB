#!/bin/sh

# start Oracle Lisner script

lisnr_name=$1

if [ -n "$lisnr_name" ];
then
  lsnrctl start $lisnr_name
else
  lsnrctl start
fi

