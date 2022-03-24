#!/system/bin/sh
# NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}
CONFIG=$MODDIR/build/etc/mdns.d/ssh.service
NAMEOFHOST=sander
PIDNAME=mdnsd

# This script will be executed in late_start service mode
while true
do
	IPADDR=$(ifconfig | grep wlan0 -C1 | awk '{print }' | grep 'inet addr' | cut -d: -f2 | awk '{ print $1 }')
#	date | awk '{print $4}' | xargs echo ipaddr: $IPADDR $1 >> $MODDIR/logging.txt
   	PGREPR=$(pgrep -x $PIDNAME)
	if [ -z $IPADDR ]; then	# if wifi/hostspot didn't get ipaddr or means not active
#		date | awk '{print $4}' | xargs echo wifi off $1 >> $MODDIR/logging.txt
		if pgrep $PIDNAME > /dev/null; then
			pgrep $PIDNAME | xargs kill
			hostname localhost
#			date | awk '{print $4}' | xargs echo PID killed $1 >> $MODDIR/logging.txt
		fi
	else
		if ! pgrep $PIDNAME > /dev/null; then #if no service then
#			date | awk '{print $4}' | xargs echo program start $1 >> $MODDIR/logging.txt
#			pgrep $PIDNAME | xargs echo PID mdnsd: $1 >> $MODDIR/logging.txt
			hostname $NAMEOFHOST
			LD_LIBRARY_PATH=$MODDIR/build/lib $MODDIR/build/sbin/mdnsd $CONFIG
		fi
	fi
	sleep 10
done
