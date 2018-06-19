// Values passed within definition files or with -var will take precedence over
// TF_VAR_ environment variables, as environment variables are considered
// defaults.
// https://www.terraform.io/docs/configuration/variables.html#variable-precedence
// https://github.com/hashicorp/terraform/issues/6778#issuecomment-243970778

resource_group_name = "german-sausage-resource_group"

location = "East US"
