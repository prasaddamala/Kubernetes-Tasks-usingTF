/* resource "kubernetes_manifest" "service_my_nginx_svc" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "nginx"
      }
      "name" = "my-nginx-svc"
    }
    "spec" = {
      "ports" = [
        {
          "port" = 80
        },
      ]
      "selector" = {
        "app" = "nginx"
      }
      "type" = "LoadBalancer"
    }
  }
}

resource "kubernetes_manifest" "deployment_my_nginx" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "nginx"
      }
      "name" = "my-nginx"
    }
    "spec" = {
      "replicas" = 4
      "selector" = {
        "matchLabels" = {
          "app" = "nginx"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "nginx"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "nginx:1.14.2"
              "name" = "nginx"
              "ports" = [
                {
                  "containerPort" = 80
                },
              ]
            },
          ]
        }
      }
    }
  }
}  */