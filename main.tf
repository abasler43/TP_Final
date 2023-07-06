variable "ssh_host" { sensitive = true }
variable "ssh_user" { sensitive = true }
variable "ssh_key" { sensitive = true }
variable "ssh_password" {sensitive = true }

 resource "null_resource" "ssh_connection_user" {
   connection {
	type = "ssh"
	ssh_host = var.ssh_host
	ssh_key = var.ssh_key
	ssh_user = var.ssh_user
	ssh_password = var.ssh_password
 }
}
module "add_image_ubuntu" {
  source = "./modules/mod_images"
}

module "add_network" {
  source = "./modules/mod_networks"
}

module "add_secgroup" {
  source = "./modules/mod_securitygroups"
}

module "add_keypair" {
  source = "./modules/mod_keypair"
}

module "add_flavor" {
  source = "./modules/mod_flavors"
}

module "ubuntu_1" {
  depends_on = [ module.add_network ]
  source               = "./modules/mod_computes"
  compute_name         = "ubuntu_web"
  compute_flavor_id    = module.add_flavor.ubuntu_flavor_id
  compute_image_id     = module.add_image_ubuntu.image_id
  compute_key_pair     = module.add_keypair.keypair_name
  compute_secgroup     = module.add_secgroup.secgroup_http_name
  compute_network_name = module.add_network.network_name
}

module "ubuntu_2" {
  depends_on = [ module.add_network, module.ubuntu_1 ]
  source               = "./modules/mod_computes"
  compute_name         = "ubuntu"
  compute_flavor_id    = module.add_flavor.ubuntu_flavor_id
  compute_image_id     = module.add_image_ubuntu.image_id
  compute_key_pair     = module.add_keypair.keypair_name
  compute_secgroup     = module.add_secgroup.secgroup_http_name
  compute_network_name = module.add_network.network_name
}
