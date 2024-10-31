resource "openstack_compute_instance_v2" "backup" {
  name            = "usegalaxy-it.database-backup"
  image_name      = data.openstack_images_image_v2.rocky_image.name
  flavor_name     = var.flavors.backup
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "egress"]

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
    uuid                  = openstack_blockstorage_volume_v3.backup_volume.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }

  user_data = file("files/create_data.sh") 

}


resource "openstack_blockstorage_volume_v3" "backup_volume" {
  name        = var.backup.name
  description = var.backup.description
  volume_type = var.backup.volume_type
  size        = var.backup.disk_size
}
