resource "azurerm_virtual_network" "avn" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = var.adrs_space
}

resource "azurerm_subnet" "sn1" {
  name                 = var.sn1_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.adrs_prefix
}

resource "azurerm_network_interface" "ni" {
  count = 3
  name                = "${var.ni_name}-${count.index}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "ipconfig1-${count.index}"
    subnet_id                     = azurerm_subnet.sn1.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_security_group" "nsg" {
  count =  3
  name = "${var.nsg_name}-${count.index}"
  location = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_virtual_machine" "vms" {
  count = 3
  name                  ="${var.vm_name}-${count.index}"
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.ni[count.index].id]

  vm_size               = var.vm_size

  delete_os_disk_on_termination   = true
  delete_data_disks_on_termination = true

  storage_os_disk {
    name              = "osdisk1-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "microsoftwindowsserver"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "Password123!"
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
}
