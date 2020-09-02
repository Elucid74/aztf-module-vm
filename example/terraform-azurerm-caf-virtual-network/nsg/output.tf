output "nsg_ids" {
  value = azurerm_network_security_group.nsg_obj.*
}

output "nsg_obj" {
  value = azurerm_network_security_group.nsg_obj
}

output "subnet_nsg_map" {
	value = local.subnet_nsg_map
}


