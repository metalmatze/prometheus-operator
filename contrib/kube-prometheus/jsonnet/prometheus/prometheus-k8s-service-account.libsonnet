local k = import "ksonnet.beta.3/k.libsonnet";
local serviceAccount = k.core.v1.serviceAccount;

{
    new(namespace, name = "k8s")::
        serviceAccount.new("prometheus-"+name) +
          serviceAccount.mixin.metadata.withNamespace(namespace)
}
