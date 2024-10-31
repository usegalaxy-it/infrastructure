# public_ip
output "galaxy" {
  value = openstack_compute_instance_v2.galaxy.network[0].fixed_ip_v4
}

# private_ip
output "galaxy" {
  value = openstack_compute_instance_v2.galaxy.network[1].fixed_ip_v4
}

# private_ip
output "mastervm" {
  value = openstack_compute_instance_v2.mastervm.network[0].fixed_ip_v4
}

# private_ip
output "nfs-server" {
  value = openstack_compute_instance_v2.nfs-server.network[0].fixed_ip_v4
}

# private_ip
output "database" {
  value = openstack_compute_instance_v2.postgres.network[0].fixed_ip_v4
}

# private_ip
output "replica" {
  value = openstack_compute_instance_v2.replica.network[0].fixed_ip_v4
}

# private_ip
output "backup" {
  value = openstack_compute_instance_v2.backup.network[0].fixed_ip_v4
}

# public_ip
output "rabbitmq" {
  value = openstack_compute_instance_v2.rabbitmq.network[0].fixed_ip_v4
}

# private_ip
output "rabbitmq" {
  value = openstack_compute_instance_v2.rabbitmq.network[1].fixed_ip_v4
}

# public_ip
output "central-manager" {
  value = openstack_compute_instance_v2.vgcn-cm.network[0].fixed_ip_v4
}

# private_ip
output "central-manager" {
  value = openstack_compute_instance_v2.vgcn-cm.network[1].fixed_ip_v4
}
