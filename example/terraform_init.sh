export TF_VAR_client_id="e0ea64e0-5b86-40bb-952e-42f025de51a7"
export TF_VAR_client_secret="ce0a03e6-6081-404f-9fd6-9a53b6be5f5b"

terraform init -backend-config="storage_account_name=hyuktf" -backend-config="container_name=tfstate" -backend-config="access_key=Hl/snWf2eIjft+J0uhQE+IVr6wfDjLcVvli4DhnSNgoaZld1PDNF247j8sxLto2zEJVWV7lcShsw00u1gKBuDg==" -backend-config="key=20200824_example.tfstate"
