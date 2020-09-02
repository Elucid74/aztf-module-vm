prefix = "demo"
location = "koreacentral"

resource_groups = {
  RESOURCEGROUP1		 = {
  	name = "-resourcegroup1"
    location = "koreacentral"
  }
}

networking_object = {
  vnet = {
    name                = "-demo-vnet"
    address_space       = ["10.10.0.0/16"]
		dns                 = []
  }
  specialsubnets = {}
  
	subnets = {
    frontend   = {
      name                = "frontend"
      cidr                = "10.10.0.0/24"
      service_endpoints   = []
			nsg_name						= "frontend"
    }
  }
}

adminusername = "azureuser"
adminpassword = "Passw0rd!123"
