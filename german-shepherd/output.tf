output "id" {
  value = "${azurerm_kubernetes_cluster.test.id}"
}

output "resource_group_name" {
  value = "${azurerm_kubernetes_cluster.test.resource_group_name}"
}

output "username" {
  value = "${azurerm_kubernetes_cluster.test.kube_config.0.username}"
}

output "password" {
  value = "${azurerm_kubernetes_cluster.test.kube_config.0.password}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.test.kube_config_raw}"
}

output "client_key" {
  value = "${azurerm_kubernetes_cluster.test.kube_config.0.client_key}"
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.test.kube_config.0.client_certificate}"
}

output "cluster_ca_certificate" {
  value = "${azurerm_kubernetes_cluster.test.kube_config.0.cluster_ca_certificate}"
}

output "host" {
  value = "${azurerm_kubernetes_cluster.test.kube_config.0.host}"
}

output "ssh_key_data" {
  value = "${azurerm_kubernetes_cluster.test.linux_profile.0.ssh_key.0.key_data}"
}
