resource "openstack_compute_instance_v2" "rabbitmq" {
  name            = "usegalaxy-it.rabbitmq"
  image_name      = data.openstack_images_image_v2.rocky_image.name
  flavor_name     = var.flavors.rabbitmq
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "public-ping", "public-amqp", "egress"]

  network {
    name = var.public_network.name
  }
  network {
    name = var.private_network.name
  }
}


