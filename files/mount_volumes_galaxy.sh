#!/bin/bash

mkfs -t xfs /dev/vdb 
mkdir -p /data/share
mount /dev/vdb /data/share
echo "/dev/vdb /data/share xfs defaults,nofail 0 2" >> /etc/fstab

mkfs -t xfs /dev/vdc 
mkdir -p /data/tool_deps
mount /dev/vdc /data/tool_deps
echo "/dev/vdc /data/tool_deps xfs defaults,nofail 0 2" >> /etc/fstab

mkfs -t xfs /dev/vdd  
mkdir -p /opt/galaxy
mount /dev/vdd /opt/galaxy
echo "/dev/vdd /opt/galaxy xfs defaults,nofail 0 2" >> /etc/fstab
