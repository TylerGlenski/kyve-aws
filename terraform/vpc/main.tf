module "vpc-kyve" {
  source           = "../modules//vpc" # path not tested buit this should work
  env              = "kyve"
  cidr_prefix      = data.terraform_remote_state.global.outputs.kyve_cidr_prefix
  aws_access_key   = var.aws_access_key
  aws_secret_key   = var.aws_secret_key
  aws_region       = data.terraform_remote_state.global.outputs.aws_region
}

