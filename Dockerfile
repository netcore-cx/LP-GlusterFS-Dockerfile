FROM ubuntu:16.04

ENV RC_VERSION 3.10

RUN apt-get update && \
    apt-get install -y apt-utils debconf-utils python-software-properties software-properties-common && \
    add-apt-repository ppa:gluster/glusterfs-${RC_VERSION} && \
    apt-get update && \
    apt-get install -y glusterfs-server && \
    mkdir /srv/gluster
    

RUN /etc/init.d/glusterfs-server start

EXPOSE 111 24007 24008 49152 49153
