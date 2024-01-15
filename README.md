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

* Run `az login --tenant TENANT_ID` where `TENANT_ID` is the `tenantId` from the `az login` terminal result.

* `az ad sp create-for-rbac --name "minimal-terraform-spa-deploy"`
    ```json
    {
        "clientId": "e7d36******",
        "clientSecret": ".lC8Q******",
        "subscriptionId": "cfe3a******",
        "tenantId": "b8e92******",
        "activeDirectoryEndpointUrl": "https******",
        "resourceManagerEndpointUrl": "https******",
        "activeDirectoryGraphResourceId": "https******",
        "sqlManagementEndpointUrl": "https******",
        "galleryEndpointUrl": "https******",
        "managementEndpointUrl": "https******"
    }
    ```
* add to repository secret as `AZURE_CREDENTIALS`