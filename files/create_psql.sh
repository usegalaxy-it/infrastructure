#!/bin/bash
mkfs -t xfs /dev/vdb  # Assicurati che /dev/vdb sia il dispositivo corretto per il volume
mkdir -p /var/lib/psql
mount /dev/vdb /var/lib/psql
echo "/dev/vdb  /var/lib/psql xfs defaults,nofail 0 2" >> /etc/fstab
chown postgres:postgres -R /var/lib/psql
systemctl restart postgresql

