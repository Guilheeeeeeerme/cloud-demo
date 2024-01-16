# Azure Terraform

* create `main.tf`
    * https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#example-usage
* run `terraform init`
* run `az login`
    * `az login` expected result on the browser
    ```
    You have logged into Microsoft Azure!
    You can close this window, or we will redirect you to the Azure CLI documentation in 1 minute.

    Announcements
    [Windows only] Azure CLI is collecting feedback on using the Web Account Manager (WAM) broker for the login experience.

    You may opt-in to use WAM by running the following commands:

    az config set core.allow_broker=true
    az account clear
    az login

    ```
    * `az login` expected result on the terminal

    ```json
    [
        {
            "cloudName": "AzureCloud",
            "homeTenantId": "b8e9****-****-****-****-********8efd",
            "id": "cfe3****-****-****-****-********3c4c",
            "isDefault": true,
            "managedByTenants": [],
            "name": "cloud-demo-subscription",
            "state": "Enabled",
            "tenantId": "b8e920ee-****-****-****-********8efd", // <--- TENANT_ID
            "user": {
            "name": "**********@outlook.com",
            "type": "user"
            }
        }
    ]
    ```


* az account list
* pick the `id` of the subscription you want
* az account set --subscription="20000000-0000-0000-0000-000000000000"
* az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/20000000-0000-0000-0000-000000000000"

* `az ad sp create-for-rbac --name "minimal-terraform-spa-deploy" --role contributor --scopes /subscriptions/{subscription-id} --json-auth`
    ```json
    {
        "appId": "87baa****",
        "displayName": "azure****",
        "password": "l.p8Q****",
        "tenant": "b8e92****",
    }
    ```
* add to repository secret as `AZURE_CREDENTIALS`

# for the local terminal
* az login
* az account list
* pick the `tenantId` of the subscription you want
* Run `az login --tenant TENANT_ID` where `TENANT_ID` is the `tenantId` from the `az login` terminal result.