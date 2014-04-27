FROM ubuntu:14.04

# prepare container
RUN apt-get update && apt-get install -y curl

# install btsync
RUN curl -o /tmp/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar xzvf /tmp/btsync.tar.gz btsync && rm /tmp/btsync.tar.gz 
RUN mkdir -p /srv/btsync

# expose webgui and btsync ports
EXPOSE 8888
EXPOSE 55555

VOLUMES ["/srv/btsync"]

ENTRYPOINT ["btsync"]
CMD ["--config", "/srv/btsync/btsync.conf", "--nodaemon"]
