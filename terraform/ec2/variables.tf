terraform {
  backend "s3" {
    bucket = "kyve-terraform-state-use1"
    key    = "ec2/main.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "global" {
  backend = "s3"

  config = {
    bucket = "kyve-terraform-state-use1"
    key    = "global/variables/main.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "kyve-terraform-state-use1"
    key    = "vpc/main.tfstate"
  }
}