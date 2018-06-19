module "k8s" {
  source              = "./german-shepherd"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  label               = "${var.label}"
  subscription_id     = "${var.subscription_id}"
  client_id           = "${var.client_id}"
  client_secret       = "${var.client_secret}"
  tenant_id           = "${var.tenant_id}"
}
