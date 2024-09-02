terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "testingdockerimage" {
  name   = "new-cluster"
  region = "nyc1"
  version = "1.30.4-do.0"

  node_pool {
    name       = "mypool"
    size       = "s-1vcpu-2gb"
    node_count = 2
  }
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.testingdockerimage.kube_config[0].raw_config
}
