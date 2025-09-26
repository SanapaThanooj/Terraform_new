resource "azurerm_eventhub_namespace" "sp" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  capacity            = 1
}


resource "azurerm_eventhub" "eh" {
  name                = var.eh_name
  namespace_name      = azurerm_eventhub_namespace.sp.name
  resource_group_name = var.rg_name
  partition_count     = 2
  message_retention   = 1
}