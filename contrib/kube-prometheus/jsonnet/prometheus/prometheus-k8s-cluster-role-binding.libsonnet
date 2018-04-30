local k = import "ksonnet.beta.3/k.libsonnet";
local clusterRoleBinding = k.rbac.v1.clusterRoleBinding;

{
    new(namespace)::
        clusterRoleBinding.new(name = "k8s") +
          clusterRoleBinding.mixin.metadata.withName("prometheus-" + name) +
          clusterRoleBinding.mixin.roleRef.withApiGroup("rbac.authorization.k8s.io") +
          clusterRoleBinding.mixin.roleRef.withName("prometheus-" + name) +
          clusterRoleBinding.mixin.roleRef.mixinInstance({kind: "ClusterRole"}) +
          clusterRoleBinding.withSubjects([{kind: "ServiceAccount", name: "prometheus-" + name, namespace: namespace}])
}
