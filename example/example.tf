locals {
  RESOURCEGROUP = lookup(module.resource_group.names, "RESOURCEGROUP1", null)
  subnet				= var.networking_object.subnets.frontend.name
}

module "example_pip" {
  source  = "github.com/hyundonk/aztf-module-pip"

  prefix   = "demo"

  services = {
    0       =  {
      name  = "jumpbox"
    }
  }

  location = var.location
  rg       = local.RESOURCEGROUP

  tags     = null
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
  source  = "../"
  #source  = "github.com/hyundonk/aztf-module-vm"

  instances = var.nodes

  location                          = var.location
  resource_group_name               = local.RESOURCEGROUP

  subnet_id                         = module.virtual_network.subnet_ids_map["frontend"]
  subnet_prefix                     = module.virtual_network.subnet_prefix_map["frontend"]

  admin_username                    = var.adminusername
  admin_password                    = var.adminpassword

  # specify cloud_init script if needed
  #custom_data                       = var.bootstrapIgnition

  # specify ssh_key_data and ssh_key_path when using ssh key
  #ssh_key_data                      = file("./sshkey/sshkey.pub")
  #ssh_key_path                      = "/home/${var.adminusername}/.ssh/authorized_keys"

  public_ip_id                      = module.example_pip.public_ip["0"].id
}
