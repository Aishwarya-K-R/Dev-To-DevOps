from kubernetes import client, config, watch

config.load_kube_config()

api = client.CustomObjectsApi()
apps = client.AppsV1Api()
core = client.CoreV1Api()
networking = client.NetworkingV1Api()

GROUP = "platform.example.com"
VERSION = "v1"
PLURAL = "appdeployments"

w = watch.Watch()

for event in w.stream(
    api.list_namespaced_custom_object,
    GROUP,
    VERSION,
    "default",
    PLURAL
):
    obj = event["object"]
    name = obj["metadata"]["name"]
    spec = obj["spec"]

    # Deployment
    deployment = client.V1Deployment(
        metadata=client.V1ObjectMeta(name=name),
        spec=client.V1DeploymentSpec(
            replicas=spec["replicas"],
            selector=client.V1LabelSelector(
                match_labels={"app": name}
            ),
            template=client.V1PodTemplateSpec(
                metadata=client.V1ObjectMeta(labels={"app": name}),
                spec=client.V1PodSpec(
                    containers=[
                        client.V1Container(
                            name=name,
                            image=spec["image"],
                            ports=[
                                client.V1ContainerPort(
                                    container_port=spec["port"]
                                )
                            ],
                        )
                    ]
                ),
            ),
        ),
    )

    try:
        apps.create_namespaced_deployment("default", deployment)
    except Exception:
        pass

    # Service
    service = client.V1Service(
        metadata=client.V1ObjectMeta(name=name),
        spec=client.V1ServiceSpec(
            selector={"app": name},
            ports=[
                client.V1ServicePort(
                    port=80,
                    target_port=spec["port"]
                )
            ],
        ),
    )

    try:
        core.create_namespaced_service("default", service)
    except Exception:
        pass

    # Ingress
    ingress = client.V1Ingress(
        metadata=client.V1ObjectMeta(name=name),
        spec=client.V1IngressSpec(
            rules=[
                client.V1IngressRule(
                    host=spec["host"],
                    http=client.V1HTTPIngressRuleValue(
                        paths=[
                            client.V1HTTPIngressPath(
                                path="/",
                                path_type="Prefix",
                                backend=client.V1IngressBackend(
                                    service=client.V1IngressServiceBackend(
                                        name=name,
                                        port=client.V1ServiceBackendPort(
                                            number=80
                                        ),
                                    )
                                ),
                            )
                        ]
                    ),
                )
            ]
        ),
    )

    try:
        networking.create_namespaced_ingress("default", ingress)
    except Exception:
        pass

