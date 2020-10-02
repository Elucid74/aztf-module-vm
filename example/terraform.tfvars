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

nodes = {
  name              = "node"
  vm_num            = 3
  vm_size           = "Standard_D2s_v3"
  subnet_ip_offset  = 4
  prefix            = null
  postfix           = null
  vm_publisher      = "Canonical"
  vm_offer          = "UbuntuServer"
  vm_sku            = "16.04.0-LTS"
  vm_version        = "latest"
}

# below is for illustration purpose. In actual environment, do not specifiy user credentials in the code. Instead use key vault or environmental variable such as TF_VAR_adminusername, TF_VAR_adminpassword. 
adminusername = "theusername"
adminpassword = "thePassw0rd"
