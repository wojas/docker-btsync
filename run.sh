#!/bin/sh

if [ "$SECRET" = "" ]; then 
	echo "ERROR: Did not receive expected SECRET environment!"
	echo "You can use this randomly generated one:"
	btsync --generate-secret
	exit 1
fi

hostname=`hostname`

known_host=""
if [ "$HOST" != "" ]; then
	known_host="\"$HOST\""
fi

cat /tmp/btsync.conf.template | sed "s/SECRET/$SECRET/;s/HOSTNAME/docker-$hostname/;s/KNOWN_HOST/$known_host/" > /tmp/btsync.conf

btsync --config /tmp/btsync.conf --nodaemon

