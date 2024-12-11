# Crossplane

## Providers

The Kubernetes provider is installed by the Crossplane Helm Chart.

It's necessary to configure the provider to allow the resource management for the cluster.

## Composition

A complete composition is composed of XRD and Composition resources.

The XRD define the custom k8s resource API.
The composition define the resources deployed by the custom k8s resource.
