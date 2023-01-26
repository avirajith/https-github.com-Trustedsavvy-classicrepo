variable "organization" {
  type = string
}
variable "environment" {
  type = string
}
variable "application" {
  type = string
}
variable "tier" {
  type = string
}
variable "rgname" {
  type        = string
  description = "This resource group for Assingment/Thursday/jan-12-2023"
}
variable "location" {
  type        = string
  description = "This region for resource group RG11/Assingment/Thursday/jan-12-2023"
}
variable "tagging" {
  type = object({
    CreatedBy  = string
    CostCenter = number
    Org        = string
  })
}
variable "pipname" {
  type        = string
  description = "This pip for resource group RG11/Assingment/Thursday/jan-12-2023"
}

variable "nsg" {
  type        = string
  description = "This nsg for resource group RG11/Assingment/Thursday/jan-12-2023"
}
variable "vnetname" {
  # type = string
  description = "This vnet for resource group RG11/Assingment/Thursday/jan-12-2023"
}
variable "address_space" {
  type = list(any)
}
variable "subnetname" {
  #   type = string
  description = "This subnet for Vnet1/Assingment/Thursday/jan-12-2023"
}

variable "address_prefixes" {
  type = list(any)
}
variable "nicname" {
  type = string
}
variable "VMname" {
  type = string
}
variable "vm_size" {

}
variable "computer_name" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "admin_password" {
  type = string
}
/*variable "diskname" {
    type = string
  default = "disk1"
  description = "This disk for resource group RG11/Assingment/Thursday/jan-12-2023"
}
variable "storage_account_type" {
  type = string
  default = "Standard_LRS"
}
variable "create_option" {
  type = string
  default = "Empty"
}
variable "disk_size_gb" {
  type = number
  default = 100
}*/