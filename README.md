# Internal Ops Project

An example cloud project built with the [Exekube framework](https://github.com/exekube/exekube)

>  :warning:  This is a work in progress


The **Internal Ops Project** contains configuration for deploying a Kubernetes cluster onto the Google Cloud Platform (GCP), as well as Kubernetes resources (via Helm charts) that result in this software released into the cloud:

- CI / CD self-hosted service (Concourse)
- A private Docker Registry (v2)
- A private ChartMuseum repository for hosting Helm charts

## Project structure

The `live` directory contains configuration for every environment (dev, stg, test, prod) for this product. The `live/terraform.tf` directory contains Terraform / Terragrunt configuration common for every environment.

```sh
├── live/
│   ├── dev/
│   ├── stg/
│   ├── prod/
│   ├── .env # variables common for every environment
│   └── terraform.tfvars # terraform config common to every environment
```

## Environment (product environment) configuration

Every environment (dev, stg, test, prod, etc.) directory is broken down into resources (cloud resources) of these categories:

- project
- kube
- secrets

```
live/
├── dev/
│   ├── project/
│   ├── kube/
│   ├── secrets/
│   ├── .env
│   └── pipelines.yaml
├── prod/
│   ├── project/
│   ├── kube/
│   ├── secrets/
│   ├── .env
│   └── pipelines.yaml
├── .env
└── terraform.tfvars
```

... to be continued ...
