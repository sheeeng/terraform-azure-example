resource "azurerm_resource_group" "test" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"

  tags {
    environment = "${var.environment_tag}"
    another_tag = "another_tag_value"
  }
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_kubernetes_cluster" "test" {
  name                = "german-shepherd"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  dns_prefix          = "dns-prefix-german-shepherd"

  linux_profile {
    admin_username = "acctestuser1"

    ssh_key {
      key_data = "${file("~/.ssh/id_rsa.pub")}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  tags {
    Environment = "${var.environment_tag}"
    FirstTag    = "FirstTag"
    SecondTag   = "SecondTag"
  }
}
