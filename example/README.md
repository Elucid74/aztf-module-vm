
This example creates the following:
 1. resource grouo
 2. virtual network
 3. a virtual machine

To run 'terraform init':

1. set environmental variables below.
```
export TF_VAR_client_id="{service-principal-client-id}"
export TF_VAR_client_secret="{service-principal-secret}"
```
2. Run 'terraform init'
```
terraform init -backend-config="storage_account_name={backend-storage-account-name}" -backend-config="container_name={backend-storage-container-name}" -backend-config="access_key={storage-account-access-key}" -backend-config="{backend-storage-account-blob-name}"
```
3. Run 'terraform apply'
```
terraform apply
```
