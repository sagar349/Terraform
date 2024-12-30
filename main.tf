provider "azurerm" {
  features {}  # Required for AzureRM provider
}

# Resource Group
resource "azurerm_resource_group" "RGexample" {
  name     = "My-resources"
  location = "East US"
}

# Virtual Network (VNet)
resource "azurerm_virtual_network" "Vnet_vnet" {
  name                = "My-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RGexample.location
  resource_group_name = azurerm_resource_group.RGexample.name
}

# Subnet
resource "azurerm_subnet" "Sub_subnet" {
  name                 = "My-subnet"
  resource_group_name  = azurerm_resource_group.RGexample.name
  virtual_network_name = azurerm_virtual_network.Vnet_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Interface
resource "azurerm_network_interface" "Vnic_nic" {
  name                = "example-nic"
  location            = azurerm_resource_group.RGexample.location
  resource_group_name = azurerm_resource_group.RGexample.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Sub_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machine
resource "azurerm_virtual_machine" "local_vm" {
  name                  = "My-vm"
  resource_group_name   = azurerm_resource_group.RGexample.name
  location              = azurerm_resource_group.RGexample.location
  network_interface_ids = [azurerm_network_interface.Vnic_nic.id]
  vm_size               = "Standard_DS1_v2"  # VM Size

  # OS Disk
  storage_os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # OS Profile
  os_profile {
    computer_name  = "example-vm"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd123!"  # Use a strong password or SSH key
  }

  # OS Profile for Linux Config
  os_profile_linux_config {
    disable_password_authentication = false
  }

  # Image Reference (Ubuntu in this case)
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
