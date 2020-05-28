# aztf-module-vm

Azure Terraform Module for Virtual Machine

# input variable 
prefix           									= "exmp"
location                          = "westus"
resource_group_name               = "testResourceGroup"

admin_username                    = "adminusername"
admin_password                    = "adminpassword"

subnet_id													=	"id of the subnet"
subnet_prefix											= "address prefix of the subnet"

instances  = {
  name          = "svc-a"
  vm_num        = 2
  vm_size       = "Standard_D4s_v3"
  subnet        = "subnet-gmarket-1"
  subnet_ip_offset  = 5
  vm_publisher      = "Canonical"
  vm_offer          = "UbuntuServer"
  vm_sku            = "16.04.0-LTS"
  vm_version        = "latest"
}

  1               = {
    name          = "svc-c"
    vm_num        = 2
    vm_size       = "Standard_D4s_v3"
    subnet        = "subnet-gmarket-3"
    subnet_ip_offset  = 5
		vm_publisher      = "MicrosoftWindowsServer"
  	vm_offer          = "WindowsServer"
  	vm_sku            = "2019-Datacenter"
  	vm_version        = "latest"
  }
}


Example) Create 2 ubuntu VMs in a subnet
```
module "service1" {
  source                            = "git://github.com/hyundonk/aztf-module-vm.git"

  prefix                            = "exmp"
  vm_num                            = 2

  vm_name                           = "svc1"
  vm_size                           = "Standard_D2s_v3"

  vm_publisher                      = "Canonical"
  vm_offer                          = "UbuntuServer"
  vm_sku                            = "16.04.0-LTS"
  vm_version                        = "latest"

  location                          = "westus"
  resource_group_name               = "testResourceGroup"

  subnet_id                         = azurerm_subnet.example.id
  subnet_prefix                     = azurerm_subnet.example.address_prefix

  subnet_ip_offset                  = 4

  admin_username                    = local.admin_username
  admin_password                    = local.admin_password
}
```

## VM Naming convention

1) No prefix is given
 1.1) no postfix
 	1.1.1) vm_num = 1
	{name}
 	1.1.1) vm_num > 1
  {name}%03d
 1.2) postfix is given
  {name}%03d{postfix}
2) prefix is given
 1.1) no postfix
  {prefix}-{name}%03d
 1.2) postfix is given
  {prefix}-{name}%03d{postfix}


