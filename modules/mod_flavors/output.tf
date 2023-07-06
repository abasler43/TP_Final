output "ubuntu_flavor_id" {
  value = openstack_compute_flavor_v2.ubuntu_flavor.id
  description = "The ubuntu flavor name"
}
