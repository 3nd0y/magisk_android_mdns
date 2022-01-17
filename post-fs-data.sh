#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread


# Edit the resolv conf file if it exist

#if [ -a /system/etc/resolv.conf ]; then
#	mkdir -p $MODDIR/system/etc/
#	printf "nameserver 1.1.1.1\nnameserver 1.0.0.1" >> $MODDIR/system/etc/resolv.conf
#	chmod 644 $MODDIR/system/etc/resolv.conf
#fi
