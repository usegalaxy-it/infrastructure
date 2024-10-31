resource "openstack_networking_secgroup_v2" "condor" {
  name                 = "public-condor"
  description          = "[tf] Allow HTCondor connections"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "public-condor-rule4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "9618"
  port_range_max    = "9618"
  security_group_id = openstack_networking_secgroup_v2.condor.id
}

resource "openstack_networking_secgroup_rule_v2" "public-condor-rule6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  remote_ip_prefix  = "::/0"
  port_range_min    = "9618"
  port_range_max    = "9618"
  security_group_id = openstack_networking_secgroup_v2.condor.id
}
