#!/bin/sh

# stop Oracle Lisner script

lisnr_name=$1


if [ -n "$lisnr_name" ];
then
  lsnrctl stop $lisnr_name
else
  lsnrctl stop
fi

