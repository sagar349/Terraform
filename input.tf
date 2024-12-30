# Resource Group Variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "my-resources"
}

variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
  default     = "East US"
}

# Virtual Network Variables
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "my-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Subnet Variables
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "my-subnet"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# Virtual Machine Variables
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "my-vm"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  default     = "P@ssw0rd123!"  # Replace with a secure password
}
