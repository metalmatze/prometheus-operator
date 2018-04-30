local prometheusNamespaceRoleBinding = import "prometheus-namespace-role-binding.libsonnet";

{
    new(namespace, name = "k8s"):: prometheusNamespaceRoleBinding.new(namespace, "default", "prometheus-"+name, "prometheus-"+name)
}
