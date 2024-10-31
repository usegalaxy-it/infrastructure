resource "openstack_compute_instance_v2" "galaxy" {
  name            = "usegalaxy-it.galaxy"
  image_name      = data.openstack_images_image_v2.rocky_image.name
  flavor_name     = var.flavors.galaxy
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["egress", "public-web", "public-ssh", "public-ping", "public-condor", "public-tus"]

  network {
    name = var.public_network.name
}

  network {
    name = var.private_network.name
  }
  
  block_device {
    uuid                  = data.openstack_images_image_v2.rocky_image.id
    source_type           = "image"
    destination_type      = "local"
    boot_index            = 0
    delete_on_termination = true
  }

  #Volume for /data/share
  block_device {
    uuid                  = openstack_blockstorage_volume_v3.share_volume.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }

  #Volume for /data/tool_deps
  block_device {
    uuid                  = openstack_blockstorage_volume_v3.tool_deps_volume.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }

  #Volume for /opt/galaxy
  block_device {
    uuid                  = openstack_blockstorage_volume_v3.galaxy_opt_volume.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }

  user_data = file("${path.module}/files/mount_volumes_galaxy.sh")

}


resource "openstack_blockstorage_volume_v3" "share_volume" {
  name        = var.galaxy_data.name
  description = var.galaxy_data.description
  volume_type = var.galaxy_data.volume_type
  size        = var.galaxy_data.disk_size
}


resource "openstack_blockstorage_volume_v3" "tool_deps_volume" {
  name        = var.galaxy_conda.name
  description = var.galaxy_conda.description
  volume_type = var.galaxy_conda.volume_type
  size        = var.galaxy_conda.disk_size
}


resource "openstack_blockstorage_volume_v3" "galaxy_opt_volume" {
  name        = var.galaxy_galaxy.name
  description = var.galaxy_galaxy.description
  volume_type = var.galaxy_galaxy.volume_type
  size        = var.galaxy_galaxy.disk_size
}
