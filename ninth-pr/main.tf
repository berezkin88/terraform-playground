module "simple_webapp" {
  source = "../modules/services/k8s-app"

  name           = "simple-webapp"
  image          = "docker.io/berezkin05/web-hello:latest"
  replicas       = 2
  container_port = 8080
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}
