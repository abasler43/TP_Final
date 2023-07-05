variable "ssh_host" { sensitive = true }
variable "ssh_user" { sensitive = true }
variable "ssh_key" { sensitive = true }

 module "os_opk_install" {
   source = "./modules/os_opk_install"
   ssh_host = var.ssh_host
   ssh_key = var.ssh_key
   ssh_user = var.ssh_user
 }

module "add_image_ubuntu" {
  depends_on = [ module.os_opk_install ]
  source = "./modules/opk_image"
}

module "add_network" {
  depends_on = [ module.os_opk_install ]
  source = "./modules/opk_network"
}

module "add_secgroup" {
  depends_on = [ module.os_opk_install ]
  source = "./modules/opk_securitygroup"
}

module "add_keypair" {
  depends_on = [ module.os_opk_install ]
  source = "./modules/opk_keypair"
}

module "add_flavor" {
  depends_on = [ module.os_opk_install ]
  source = "./modules/opk_flavor"
}

module "ubuntu_1" {
  depends_on = [ module.add_network ]
  source               = "./modules/opk_compute"
  compute_name         = "ubuntu_web"
  compute_flavor_id    = module.add_flavor.ubuntu_flavor_id
  compute_image_id     = module.add_image_ubuntu.image_id
  compute_key_pair     = module.add_keypair.keypair_name
  compute_secgroup     = module.add_secgroup.secgroup_http_name
  compute_network_name = module.add_network.network_name
}

module "ubuntu_2" {
  depends_on = [ module.add_network, module.ubuntu_1 ]
  source               = "./modules/opk_compute"
  compute_name         = "ubuntu"
  compute_flavor_id    = module.add_flavor.ubuntu_flavor_id
  compute_image_id     = module.add_image_ubuntu.image_id
  compute_key_pair     = module.add_keypair.keypair_name
  compute_secgroup     = module.add_secgroup.secgroup_http_name
  compute_network_name = module.add_network.network_name
