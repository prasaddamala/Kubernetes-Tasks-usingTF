terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.23.0"
    }
  }
}
 provider "kubernetes" {
  # Configuration options
  config_path    = "~/.kube/config"
  config_context = "arn:aws:eks:us-west-2:231299874646:cluster/ed-eks-01"
} 
