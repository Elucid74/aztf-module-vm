locals {
  RESOURCEGROUP = lookup(module.resource_group.names, "RESOURCEGROUP1", null)
  subnet				= var.networking_object.subnets.frontend.name
}

module "resource_group" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1" 
		
  prefix          = var.prefix
  resource_groups = var.resource_groups
  tags            = {}
}


module "virtual_network" {
  source  = "github.com/hyundonk/terraform-azurerm-caf-virtual-network"
  
  virtual_network_rg                = local.RESOURCEGROUP
  prefix                            = var.prefix
  location                          = var.location
  networking_object                 = var.networking_object
  tags            = {}
}

module "example" {
  source  = "github.com/hyundonk/aztf-module-vm"

  instances = var.nodes

  location                          = var.location
  resource_group_name               = local.RESOURCEGROUP

  subnet_id                         = module.virtual_network.subnet_ids_map["frontend"]
  subnet_prefix                     = module.virtual_network.subnet_prefix_map["frontend"]

  admin_username                    = var.adminusername
  admin_password                    = var.adminpassword
}


