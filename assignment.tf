resource "azurerm_resource_group" "assignment" {
  name     = "TS-Dev-App-diskrg"
  location = "East US"
  tags = {
    environment = "dev"
    createdby= "TSteam"
  }
}

resource "azurerm_managed_disk" "assignment" {
  name                 = "TS-Dev-App-disk"
  location             = azurerm_resource_group.assignment.location
  resource_group_name  = azurerm_resource_group.assignment.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  tags = {
    environment = "dev"
    createdby= "TSteam"
  }
}

resource "azurerm_managed_disk" "assignment1" {
  name                 = "TS-Dev-App-datadisk"
  location             = azurerm_resource_group.assignment.location
  resource_group_name  = azurerm_resource_group.assignment.name
  storage_account_type = "Standard_LRS"
  create_option        = "Copy"
  source_resource_id   = azurerm_managed_disk.assignment.id
  disk_size_gb         = "1"

  tags = {
    environment = "dev"
    createdby= "TSteam"
  }

}
  resource "azurerm_managed_disk" "assignment2" {
  name                 = "TS-Dev-App-logdisk"
  location             = azurerm_resource_group.assignment.location
  resource_group_name  = azurerm_resource_group.assignment.name
  storage_account_type = "Standard_LRS"
  create_option        = "Copy"
  source_resource_id   = azurerm_managed_disk.assignment.id
  disk_size_gb         = "1"

  tags = {
    environment = "dev"
    createdby= "TSteam"
  }
 
}
 
resource "azurerm_managed_disk" "assignment3" {
    name                 = "TS-Dev-App-osdisk"
    location             = azurerm_resource_group.assignment.location
    resource_group_name  = azurerm_resource_group.assignment.name
    storage_account_type = "Standard_LRS"
    create_option        = "Copy"
    source_resource_id   = azurerm_managed_disk.assignment.id
    disk_size_gb         = "1"
  
    tags = {
      environment = "dev"
      createdby= "TSteam"
    }
    
}