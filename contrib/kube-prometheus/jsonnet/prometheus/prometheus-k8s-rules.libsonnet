local k = import "ksonnet.beta.3/k.libsonnet";
local configMap = k.core.v1.configMap;

{
    new(namespace, ruleFiles, name = "k8s")::
        configMap.new("prometheus-"+name+"-rules", ruleFiles) +
          configMap.mixin.metadata.withLabels({role: "alert-rules", prometheus: name}) +
          configMap.mixin.metadata.withNamespace(namespace)
}
