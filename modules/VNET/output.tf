output "Vnet_id"{
    value = azurerm_virtual_network.avn.id
}
output "subnet_id"{
    value = azurerm_subnet.sn1.id
}
output "nic_id"{
    value = azurerm_network_interface.ni[*].id
}
output "vm_id"{
    value = azurerm_virtual_machine.vms[*].id
}
