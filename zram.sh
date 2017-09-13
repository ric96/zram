#!/bin/bash
modprobe zram num_devices=4

totalmem=`free | grep -e "^Mem:" | awk '{print $2}'`
mem=$(( ($totalmem)* 1024 * 3))

echo $mem > /sys/block/zram0/disksize

mkswap /dev/zram0

swapon -p 5 /dev/zram0
