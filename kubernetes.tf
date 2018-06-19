provider "kubernetes" {
  host                   = "${module.k8s.host}"
  client_certificate     = "${base64decode(module.k8s.client_certificate)}"
  client_key             = "${base64decode(module.k8s.client_key)}"
  cluster_ca_certificate = "${base64decode(module.k8s.cluster_ca_certificate)}"
}

resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx-example"

    labels {
      App = "nginx"
    }
  }

  spec {
    container {
      image = "nginx:1.7.8"
      name  = "example"

      port {
        container_port = 80
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
  }

  spec {
    selector {
      App = "${kubernetes_pod.nginx.metadata.0.labels.App}"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

output "lb_ip" {
  value = "${kubernetes_service.nginx.load_balancer_ingress.0.ip}"
}
