provider "azurerm" {
   # version = "1.3.7"
    features {  }
subscription_id = "73e834f0-ad18-4bc0-a105-041883eeb7df"
client_id = "507c4877-d229-48eb-b657-4532643d2e5f"
client_secret = "RaV8Q~lDLQsf1rNeILd.V4mIh64H0X0MYG8-YcQc"
tenant_id = "c8db9708-98f7-4eb5-8e0e-62c710c8f34b"

}
locals {
  prefix = "${var.organization}-${var.environment}-${var.application}-${var.tier}"
}
resource "azurerm_resource_group1" "rgg1" {
  name     = "${local.prefix}-${var.rgname}"
  location = var.location
  tags = var.tagging
}
resource "azurerm_virtual_network" "vnett" {
  name                = "${local.prefix}-${var.vnetname}"
  address_space       = var.address_space
  location            = azurerm_resource_group.rgg.location
  resource_group_name = azurerm_resource_group.rgg.name
}
resource "azurerm_subnet" "subnett1" {
  name                 = "${var.vnetname}-${var.subnetname}"
  resource_group_name  = azurerm_resource_group.rgg.name
  virtual_network_name = azurerm_virtual_network.vnett.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_network_interface" "nicc" {
  name                = "${local.prefix}-${var.nicname}"
  location            = azurerm_resource_group.rgg.location
  resource_group_name = azurerm_resource_group.rgg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnett1.id
    private_ip_address_allocation = "Dynamic"
public_ip_address_id = azurerm_public_ip.pipp.id
  }
}
resource "azurerm_public_ip" "pipp" {
  name                = "${var.vnetname}-${var.pipname}"
  resource_group_name = azurerm_resource_group.rgg.name
  location            = azurerm_resource_group.rgg.location
  allocation_method   = "Static"

  tags = var.tagging
}

resource "azurerm_network_security_group" "nsgg" {
  name                ="${local.prefix}-${var.nsg}"
  location            = azurerm_resource_group.rgg.location
  resource_group_name = azurerm_resource_group.rgg.name
security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 3389
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.nicc.id
  network_security_group_id = azurerm_network_security_group.nsgg.id
}
resource "azurerm_virtual_machine" "vmm" {
  name                  = "${local.prefix}-${var.VMname}"
  location              = azurerm_resource_group.rgg.location
  resource_group_name   = azurerm_resource_group.rgg.name
  network_interface_ids = [azurerm_network_interface.nicc.id]
  vm_size               = var.vm_size 

  os_profile_windows_config{}

 delete_os_disk_on_termination = true

   delete_data_disks_on_termination = true

storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
 
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  
  tags = var.tagging
}


