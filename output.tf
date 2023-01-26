output "rgname" {
  value = azurerm_resource_group.rgg.name
}
output "location" {
  value = azurerm_resource_group.rgg.location
}
output "tags" {
  value = azurerm_resource_group.rgg.tags
}
output "VM-Name" {
  value = azurerm_virtual_machine.vmm.name
}
output "Vnet-Name" {
  value = azurerm_virtual_network.vnett.name
}
output "Vnet-address" {
  value = azurerm_virtual_network.vnett.address_space
}
output "Subnet1-Name" {
  value = azurerm_subnet.subnett1.name
}
output "Subnet1-address" {
  value = azurerm_subnet.subnett1.address_prefixes
}

output "NIC-Name" {
  value = azurerm_network_interface.nicc.name
}
output "Public-ip" {
  value = azurerm_public_ip.pipp.name
}
output "NSG" {
  value = azurerm_network_security_group.nsgg.name
}
