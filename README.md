# Drone CI, Registry, Argo CD & Git repository (DRAG) Stack

In this workshop you will learn how to setup [Drone](https://drone.io), [Argo CD](https://argo-cd.readthedocs.io/), [Gitea](https://gitea.io/) and Docker Registry via Nexxus, and [k3d](k3d.io/) as your local **[k3s](https://k3s.io)** based Kubernetes Cluster.

This workshop also shows how to use the Argo CD [declarative setup](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/) to setup [Drone CI](https://drone.io) with Drone Kubernetes runner.

The stack also deploys [Argo CD Image Updater](https://argocd-image-updater.readthedocs.io/en/stable) to enable updating the application images via GitOps.

## Required tools

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [k3d](https://k3d.io/)
- [Helm](https://helm.sh/)
- [Kustomize](https://kustomize.io/)
- [httpie](https://httpie.io/)
- [envsusbst](https://www.man7.org/linux/man-pages/man1/envsubst.1.html)

All linux distributions adds **envsubst** via [gettext](https://www.gnu.org/software/gettext/) package. On macOS it can be installed using [Homebrew](https://brew.sh/) like `brew install gettext`.

### Optional

- [Argo CD CLI](https://github.com/argoproj/argo-cd/releases/latest)
- [direnv](https://direnv.net/)
- [yq](https://github.com/mikefarah/yq)
- [jq](https://stedolan.github.io/jq/)
- [stern](https://github.com/wercker/stern)

## Clone the Sources

```shell
git clone https://github.com/harness-apps/drag-stack && \
  cd "$(basename "$_" .git)" && direnv allow .
```

As instructed lets reset the environment,

```shell
direnv allow .
```

## Create Kubernetes Cluster

```shell
$DAG_HOME/hack/cluster.sh
```

### Deploy Gitea

```shell
$DAG_HOME/hack/install-gitea
```

You can now access Gitea in your browser using the url <http://gitea-127.0.0.1.sslip.io:30950>. Default credentials `demo/demo@123`.

## Deploy ArgoCD

```shell
$DAG_HOME/hack/install-argocd
```

You can now access Argo CD in your browser using the url <http://argocd-127.0.0.1.sslip.io:30080>. Default credentials `admin/demo@123`.

## Cluster Bootstrapping

The cluster bootstrapping  that we did in earlier step installs the core DRAG stack applications ([App of Apps](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#app-of-apps)) and DRAG stack has the following child applications,

- Argo CD Image Updater
- Drone Server
- Droner Runners
- Nexus3 Maven Repository Manager

A successful ArgoCD Deployment of Drone should look as shown below,

![ArgoCD Apps](./docs/images/dag_apps.png)

You can now access Drone CI in your browser using the url <http://drone-127.0.0.1.sslip.io:30080>.

## Verify Gitea Patch

Verify the `/etc/hosts` entries in the gitea pods,

```shell
kubectl exec -it gitea-0 -n default cat /etc/hosts
```

It should have entry like

```shell
# Entries added by HostAliases.
$DRONE_SERVICE_IP   drone-127.0.0.1.sslip.io
```

## Validate Drone Setup

What we have done until now,

- Setup Gitea
- Setup Argo CD
- Setup `dag-apps` Argo CD that in turn setup
  - Drone Server
  - Drone Kube Runner
  - Drone Docker Runner

### Add Drone Admin User

Copy the account settings named `Example CLI Usage` from the Drone Account Settings page, verify if its all good,

```shell
drone info
```

### Do some GitOps

**Congratulations**!!! You are now a GitOpsian. Add other projects of yours and keep rocking with Drone CI and Argo CD.

Few applications that you can try with this stack,

- <https://github.com/haness-apps/quarkus-springboot-demo-gitops>
- <https://github.com/harness-apps/MERN-Stack-Example>

## Gotchas

Captured some learnings in [gotchas](./gotchas.md) for pointers and helpful commands.

## Clean up

```shell
k3d -c hack/k3s-cluster-config.yaml
```
