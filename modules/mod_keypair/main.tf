terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}
resource "openstack_compute_keypair_v2" "my-keypair" {
  name = "my-keypair"
}
