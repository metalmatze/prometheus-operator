local k = import "ksonnet.beta.3/k.libsonnet";

local container = k.core.v1.pod.mixin.spec.containersType;
local resourceRequirements = container.mixin.resourcesType;
local selector = k.apps.v1beta2.deployment.mixin.spec.selectorType;

local resources = resourceRequirements.new() +
  resourceRequirements.withRequests({memory: "400Mi"});

{
    new(namespace, name="k8s", replicas = 2)::
        {
          apiVersion: "monitoring.coreos.com/v1",
          kind: "Prometheus",
          metadata: {
            name: name,
            namespace: namespace,
            labels: {
              prometheus: name,
            },
          },
          spec: {
            replicas: replicas,
            version: "v2.2.1",
            serviceAccountName: "prometheus-" + name,
            serviceMonitorSelector: selector.withMatchExpressions({key: "k8s-app", operator: "Exists"}),
            ruleSelector: selector.withMatchLabels({
              role: "alert-rules",
              prometheus: name,
            }),
            resources: resources,
            alerting: {
              alertmanagers: [
                {
                  namespace: "monitoring",
                  name: "alertmanager-main",
                  port: "web",
                },
              ],
            },
          },
        }
}
