FROM ubuntu:14.04

# prepare container
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y curl

# install btsync
RUN curl -o /tmp/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar xzvf /tmp/btsync.tar.gz btsync && rm /tmp/btsync.tar.gz 
RUN mkdir -p /btsync/.sync

# expose btsync port
EXPOSE 55555

VOLUME ["/btsync"]

ADD ./btsync.conf.template /tmp/btsync.conf.template 
ADD ./run.sh /run.sh
CMD /run.sh
