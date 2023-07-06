terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}
resource "openstack_images_image_v2" "ubuntu_image" {
  name        = "ubuntu"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "public"
  min_disk_gb = 10
  min_ram_mb = 1024
  image_source_url =  "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}
