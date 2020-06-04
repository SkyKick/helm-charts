# SkyKick Helm Charts

This repo contains all of SkyKick's publicly available Helm charts.

## aad-pod-identity-add-identity

This chart is to be used in conjunction with [Azure's AAD Pod Identity](https://github.com/Azure/aad-pod-identity). This chart is used to deploy an instance of an identity.

## cloud-manager-sandbox

This chart will deploy a sandbox instance used in Cloud Manager.

## Common commands (with examples)

- Generate the Helm package: `helm package .\cloud-manager-sandbox`
- Generate the Helm repository index: `helm repo index --url https://skykick.github.io/helm-charts/ .`
