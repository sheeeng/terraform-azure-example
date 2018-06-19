# terraform-azure-example

Example project that demonstrates how [Terraform][terraform-link] manages [Azure][azure-link] infrastructure.

## Getting Started

* Configure [variables][terraform-link-docs-configuration-variables].

* Use [direnv][direnv-link].

Create `.direnv` file with the below content. The `.direnv` file is included in `.gitignore`.

```shell

export ARM_SUBSCRIPTION_ID="CHANGEME_ARM_SUBSCRIPTION_ID"

export ARM_CLIENT_ID="CHANGEME_ARM_CLIENT_ID"
export ARM_CLIENT_SECRET="CHANGEME_ARM_CLIENT_SECRET"
export ARM_TENANT_ID="CHANGEME_ARM_TENANT_ID"

export TF_VAR_resource_group_name="CHANGEME_RESOURCE_GROUP_NAME"
export TF_VAR_location="CHANGEME_LOCATION"

export TF_VAR_subscription_id="CHANGEME_SUBSCRIPTION_ID"
export TF_VAR_client_id="CHANGEME_CLIENT_ID"
export TF_VAR_client_secret="CHANGEME_CLIENT_SECRET"
export TF_VAR_tenant_id="CHANGEME_TENANT_ID"

```

* Run `brew update && brew install azure-cli`.

* Run `az login`.

* Use the default Azure Subscription ID by `az account list --query [?isDefault] | jq '.[].id'`.

* Configure [Azure][azure-link] subscription.

```shell

az account set --subscription=$(ARM_SUBSCRIPTION_ID)
az account list

```

* Create an Azure [service principal][service-principle-link] and configure its access to Azure resources.

```shell

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$(ARM_SUBSCRIPTION_ID)"

```

The output of the `create-for-rbac` command is in the following format:

```json

{
  "appId": "00000000-0000-0000-0000-000000000000",
  "displayName": "azure-cli-2018-01-01-00-00-00",
  "name": "http://azure-cli-2018-01-01-00-00-00",
  "password": "00000000-0000-0000-0000-000000000000",
  "tenant": "00000000-0000-0000-0000-000000000000"
}

```

* Login using the service principle. The `appId` (`$ARM_CLIENT_ID`), `tenant` (`$ARM_TENANT_ID`), and `password` (`$ARM_CLIENT_SECRET`) values are used for authentication. The `displayName` is used when searching for an existing service principal.

```shell

az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID

```

* Run `az vm list-sizes --location westus`

* Run `terraform init`.

* Run `terraform plan`.

* Run `terraform apply`.

* Run `terraform output`.

* Run `terraform show`.

* Run `az aks list -g $(CHANGEME_RESOURCE_GROUP_NAME)`.

* Run `terraform destroy`.

[terraform-link]: https://www.terraform.io/
[azure-link]: https://azure.microsoft.com/
[terraform-link-docs-configuration-variables]: https://www.terraform.io/docs/configuration/variables.html#environment-variables
[direnv-link]: https://direnv.net/
[service-principle-link]: https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli
