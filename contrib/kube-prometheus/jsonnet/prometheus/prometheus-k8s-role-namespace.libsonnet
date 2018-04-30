local prometheusNamespaceRole = import "prometheus-namespace-role.libsonnet";

{
    new(namespace, name = "k8s"):: prometheusNamespaceRole.new(namespace, name)
}
