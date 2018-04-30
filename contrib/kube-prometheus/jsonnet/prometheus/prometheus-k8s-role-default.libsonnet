local prometheusNamespaceRole = import "prometheus-namespace-role.libsonnet";

{
    new(name = "k8s"):: prometheusNamespaceRole.new("default", name)
}
