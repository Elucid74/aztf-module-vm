variable "instances_defaults" {
  description = "VM instance configuration parameters"

	type = object({
		name 							= string
		vm_num						= number
		vm_size						= string
		subnet_ip_offset	= number

		vm_publisher			= string
		vm_offer					= string
		vm_sku						= string
		vm_version				= string
		prefix						= string
		postfix						= string
	})

	default = {
 		name          		= "myvm"
 		vm_num        		= 1
 		vm_size       		= "Standard_D4s_v3"
 		subnet_ip_offset  = 4
		prefix						= null
		postfix						= null
 		vm_publisher      = "Canonical"
 		vm_offer          = "UbuntuServer"
 		vm_sku            = "16.04.0-LTS"
 		vm_version        = "latest"
	}
}

variable "instances" {
  description = "Map of instances  settings to be applied which will be merged with the instances_defaults"
}

variable "update_domain_count" {
  default = 5 
}

variable "fault_domain_count" {
	default = 2 # Korea regions support up to 2 fault domains
}

variable "image_id" {
  description = "If specified, VM is created from the image ID"        
	default = null
}

variable "resource_group_name" {
  description = "resource group name"
}

variable "location" {
  description = "resource location"
}

variable "tags" {
  description = "tags"
  default = null
}

variable "subnet_id" {
  description = "subnet ID"
}
 
variable "subnet_prefix" {
  description = "subnet prefix" 
}
        
variable "public_ip_id" {
  description = "ID of public IP resource. Optional" 
  default = null
}


variable "admin_username" {
  description = "username for vm admin"
}

variable "admin_password" {
  description = "password for vm admin"
}

variable "boot_diagnostics_endpoint" {
  description = "blob storage URL for boot diagnostics"
  default = null        
}

variable "custom_data" {
  description = "local path to custom data file for cloud_init"
  default = null
}

variable "diag_storage_account_name"        {
  description = "storage account name for diagnostics log"
  default = null      
}

variable "diag_storage_account_access_key"  {
  description = "storage account access key for diagnostics log"
  default = null      
}

variable "diag_storage_account_endpoint"  {
  description = "storage account access key for diagnostics log"
  default = null      
}

variable "log_analytics_workspace_id"  {
  description = "log analytics workspace ID for diagnostics log"
  default = null      
}

variable "log_analytics_workspace_key"  {
  description = "log analytics workspace key for diagnostics log"
  default = null      
}       

variable "enable_network_watcher_extension" {
  description = "true to install network watcher extension" 
  default = false
}

variable "enable_dependency_agent" {
  description = "true to install dependency agent" 
  default = false
}

variable "enable_aadlogin" {
  description = "true to install aadlogin vm extension" 
  default = false
}


variable "application_insights_key" {
  description = "application insights instrumentation key"
  default = null
}

variable "load_balancer_param" {
  description = "load balancer parameters"
  type = object({
    sku             = string
    probe_protocol  = string
    probe_port      = number
    probe_interval  = number
    probe_num       = number
  })

  default = null
  
  /* example
  default = {
      sku             = "basic"
      probe_protocol  = "Tcp"
      probe_port      = 22
      probe_interval  = 5
      probe_num       = 2
  }
  */
}

variable "backend_outbound_address_pool_id" {
  description = "Backend Outbound Address Pool ID of external load balancer. This can be used for assign outbound public IP address pool"
  default = null
}

