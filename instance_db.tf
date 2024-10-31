resource "openstack_compute_instance_v2" "postgres" {
  name            = "usegalaxy-it.database"
  image_name      = data.openstack_images_image_v2.rocky_image.name
  flavor_name     = var.flavors.database
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "private-db", "egress"]

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

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.postgres_volume.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.data_volume.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }

  user_data = file("${path.module}/files/mount_volumes_db.sh")
}

resource "openstack_blockstorage_volume_v3" "postgres_volume" {
  name        = var.db_ssd.name
  description = var.db_ssd.description
  volume_type = var.db_ssd.volume_type
  size        = var.db_ssd.disk_size
}

resource "openstack_blockstorage_volume_v3" "data_volume" {
  name        = var.db_default.name
  description = var.db_default.description
  volume_type = var.db_default.volume_type
  size        = var.db_default.disk_size
}



