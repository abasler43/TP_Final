output "network_name" {
  value = openstack_networking_network_v2.vm_network.name
}

output "subnet_name" {
  value = openstack_networking_subnet_v2.vm_subnet.name
}
