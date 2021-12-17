<div align="center">
<img src="https://avatars.githubusercontent.com/u/80524516?s=200&v=4">
</div>
<br>
<br>

<div align="Center">
<h1>Myriad Node</h1>
<h2>It's Your Turn to Own Your Web</h2>
Starting with Myriad.Social, we are creating a platform where social app, metaverse and messenger seamlessly integrate, together and with further applications. As a user, a content creator or a builder, Myriad is designed to be yours.
<br>
<br>

[![](https://github.com/myriadsocial/charts/workflows/Release%20Charts/badge.svg?branch=main)](https://github.com/myriadsocial/charts/actions)
[![Medium](https://img.shields.io/badge/Medium-Myriad-brightgreen?logo=medium)](https://medium.com/@myriadsocial.blog)
</div>

---

## Actions

* [@helm/kind-action](https://github.com/helm/kind-action)
* [@helm/chart-testing-action](https://github.com/helm/chart-testing-action)
* [@helm/chart-releaser-action](https://github.com/helm/chart-releaser-action)

## Project Status

`main` supports Helm 3 only, i. e. both `v1` and `v2` [API version](https://helm.sh/docs/topics/charts/#the-apiversion-field) charts are installable.

## Chart Sources

* `charts/myriad-node`: Myriad Node Chart
* `charts/myriad-db`  : Myriad DB Chart
* `charts/myriad-api` : Myriad API Chart
* `charts/myriad-web` : Myriad WebApp Chart
* `charts/myriad-cms` : Myriad CMS Chart

## Usage

```bash
helm repo add myriadsocial https://charts.myriad.social
helm repo update
helm install myriad-node myriadsocial/myriad-node
```
