resource "openstack_compute_instance_v2" "vgcn-cm" {
  name            = "usegalaxy-it.condor-cm"
  image_name      = data.openstack_images_image_v2.vgcn_image.name
  flavor_name     = var.flavors.central-manager
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-condor", "public-ssh", "egress", "public-ping"]

  network {
    name = var.public_network.name
  }

  network {
    name = var.private_network.name
  }
}
