resource "kubernetes_manifest" "clusterrole_alb_ingress_controller" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRole"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/name" = "alb-ingress-controller"
      }
      "name" = "alb-ingress-controller"
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
          "extensions",
        ]
        "resources" = [
          "configmaps",
          "endpoints",
          "events",
          "ingresses",
          "ingresses/status",
          "services",
        ]
        "verbs" = [
          "create",
          "get",
          "list",
          "update",
          "watch",
          "patch",
        ]
      },
      {
        "apiGroups" = [
          "",
          "extensions",
        ]
        "resources" = [
          "nodes",
          "pods",
          "secrets",
          "services",
          "namespaces",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrolebinding_alb_ingress_controller" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/name" = "alb-ingress-controller"
      }
      "name" = "alb-ingress-controller"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "alb-ingress-controller"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "alb-ingress-controller"
        "namespace" = "kube-system"
      },
    ]
  }
}

resource "kubernetes_manifest" "serviceaccount_kube_system_alb_ingress_controller" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/name" = "alb-ingress-controller"
      }
      "name" = "alb-ingress-controller"
      "namespace" = "kube-system"
    }
  }
}