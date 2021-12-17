# Myriad Social Helm Charts

[![](https://github.com/myriadsocial/charts/workflows/Release%20Charts/badge.svg?branch=main)](https://github.com/myriadsocial/charts/actions)

Myriad Social Helm Charts

## Actions

* [@helm/kind-action](https://github.com/helm/kind-action)
* [@helm/chart-testing-action](https://github.com/helm/chart-testing-action)
* [@helm/chart-releaser-action](https://github.com/helm/chart-releaser-action)

## Project Status

`main` supports Helm 3 only, i. e. both `v1` and `v2` [API version](https://helm.sh/docs/topics/charts/#the-apiversion-field) charts are installable.

## Chart Sources

* `charts/node`: Myriad Node Chart
* `charts/db`: Myriad DB Chart
* `charts/api`: Myriad API Chart
* `charts/web`: Myriad WebApp Chart
* `charts/cms`: Myriad CMS Chart

## Usage

```bash
helm repo add myriad https://charts.myriad.social
helm repo update
helm install myriad-node myriad/node
```
