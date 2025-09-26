output "namespace_id" {
    value = azurerm_eventhub_namespace.sp.id
}
output "eventhub_id" {
    value = azurerm_eventhub.eh.id
}

output "rg_name" {
  value = var.rg_name
}