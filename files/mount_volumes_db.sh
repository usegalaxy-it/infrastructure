#!/bin/bash

mkfs -t xfs /dev/vdb  
mkdir -p /var/lib/psql
mount /dev/vdb /var/lib/psql
echo "/dev/vdb /var/lib/psql xfs defaults,nofail 0 2" >> /etc/fstab

mkfs -t xfs /dev/vdc  
mkdir -p /data
mount /dev/vdc /data
echo "/dev/vdc /data xfs defaults,nofail 0 2" >> /etc/fstab

chown postgres:postgres -R /var/lib/psql
chown centos:centos -R /data
