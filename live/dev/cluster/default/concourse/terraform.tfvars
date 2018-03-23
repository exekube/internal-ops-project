# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/exekube-modules//helm-release"
  }

  dependencies {
    paths = [
      "../../cluster",
      "../../kube-system/ingress-controller",
      "../../kube-system/kube-lego",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

release_spec = {
  enabled      = true
  release_name = "concourse"

  chart_repo    = "stable"
  chart_name    = "concourse"
  chart_version = "1.0.4"

  domain_name = "ci.flexeption.pw"
}

pre_hook = {
  command = "kubectl apply -f $TF_VAR_secrets_dir/default/concourse/secrets.yaml"
}

post_hook = {
  command = "kubectl apply -f $TF_VAR_secrets_dir/default/ci/"
}