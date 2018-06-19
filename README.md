# example-terraform-azure

Example project that demonstrates how [Terraform][terraform-link] manages [Azure][azure-link] infrastructure.

## Getting Started

* Configure [variables][terraform-link-docs-configuration-variables].

```shell

export TF_VAR_resource_group_name="CHANGEME_RESOURCE_GROUP_NAME"
export TF_VAR_location="CHANGEME_LOCATION"

export TF_VAR_subscription_id="CHANGEME_SUBSCRIPTION_ID"
export TF_VAR_client_id="CHANGEME_CLIENT_ID"
export TF_VAR_client_secret="CHANGEME_CLIENT_SECRET"
export TF_VAR_tenant_id="CHANGEME_TENANT_ID"

```

* Run `terraform init`.

* Run `terraform plan`.

* Run `terraform apply`.

* Run `terraform show`.

* Run `terraform destroy`.

[terraform-link]: https://www.terraform.io/
[azure-link]: https://azure.microsoft.com/
[terraform-link-docs-configuration-variables]: https://www.terraform.io/docs/configuration/variables.html#environment-variables
