{
    new(namespace, name)::
        {
            "apiVersion": "monitoring.coreos.com/v1",
            "kind": "ServiceMonitor",
            "metadata": {
                "name": "prometheus",
                "namespace": namespace,
                "labels": {
                    "k8s-app": "prometheus"
                }
            },
            "spec": {
                "selector": {
                    "matchLabels": {
                        "prometheus": name,
                    }
                },
                "namespaceSelector": {
                    "matchNames": [
                        "monitoring"
                    ]
                },
                "endpoints": [
                    {
                        "port": "web",
                        "interval": "30s"
                    }
                ]
            }
        }
}
