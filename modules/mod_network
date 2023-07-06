terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}
resource "openstack_networking_network_v2" "vm_network" {
  name            = "terraform_network"
  admin_state_up  = true
}

resource "openstack_networking_subnet_v2" "vm_subnet" {
  name            = "terraform-subnet"
  network_id      = openstack_networking_network_v2.vm_network.id
  cidr            = ""
  ip_version      = 4
  enable_dhcp = true
  gateway_ip      = ""
  allocation_pool {
    start = ""
    end   = ""
  }
  
}
