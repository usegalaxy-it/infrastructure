#!/bin/bash
mkfs -t xfs /dev/vdb  # Assicurati che /dev/vdb sia il dispositivo corretto
mkdir -p /data
mount /dev/vdb /data
echo "/dev/vdb  /data xfs defaults,nofail 0 2" >> /etc/fstab
chown centos:centos -R /data
