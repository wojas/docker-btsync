BitTorrent Sync Dockerfile
==========================

This will build a [docker](http://www.docker.io/) image that runs 
[BitTorrent Sync](http://labs.bittorrent.com/experiments/sync.html).


### Building the Image ###

```
docker build -t btsync .
```


### Running BitTorrent Sync ###

```
docker run -d --name mybtsync -p 55555:55555 -e SECRET=ANL7... -v /btsync/ btsync
```

where ANL7... is the secret. If you don't specify a secret, one will be created for you 
and the container will immediately exit.

55555 is the btsync listening port we use. If you do not explicitly set a public port, 
a random open port will be used because the ports are exposed in the Dockerfile

`-v` mount a local directory in the container `[host-dir]:[container-dir]`. If you 
leave of the `host-dir`, a random place will be used.

To have another container use this volume:

```
docker run -i -t --volumes-from mybtsync busybox /bin/ls /btsync
```

If you have another host running btsync with a known IP and port, you can specify it
using `-e HOST=192.168.59.3:12345`, for faster discovery.


### Tutorial ###
More details are available in [this tutorial](http://blog.bittorrent.com/2013/10/22/sync-hacks-deploy-bittorrent-sync-with-docker/).
