output "host" {
  value = "${module.k8s.host}"
}

output "resource_group_name" {
  value = "${module.k8s.resource_group_name}"
}

output "username" {
  value = "${module.k8s.username}"
}

output "password" {
  value = "${module.k8s.password}"
}

output "client_certificate" {
  value = "${module.k8s.client_certificate}"
}

output "client_key" {
  value = "${module.k8s.client_key}"
}

output "cluster_ca_certificate" {
  value = "${module.k8s.cluster_ca_certificate}"
}

output "kube_config" {
  value = "${module.k8s.kube_config}"
}

output "ssh_key_data" {
  value = "${module.k8s.ssh_key_data}"
}
