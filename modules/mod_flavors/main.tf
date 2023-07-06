terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}

resource "openstack_compute_flavor_v2" "ubuntu_flavor" {
    name= "ubuntu_flavor"
    ram = "1024"
    vcpus = "1"
    disk = "10"  
    is_public = true

}
