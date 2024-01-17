# Azure Terraform

* https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret

```shell

az account list
# pick the `id` of the subscription you want    

az account set --subscription="20000000-0000-0000-0000-000000000000"

az ad sp create-for-rbac \
    --role="Contributor" \
    --scopes="/subscriptions/20000000-0000-0000-0000-000000000000"

# appId is the client_id defined above.
# password is the client_secret defined above.
# tenant is the tenant_id defined above.

```

# for the local terminal

* `az login`
* `az account list`
* pick the `tenantId` of the subscription you want
* Run `az login --tenant TENANT_ID` where `TENANT_ID` is the `tenantId` from the `az login` terminal result.



* create `main.tf`
    * https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#example-usage
* run `terraform init`