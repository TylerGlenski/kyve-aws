variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "env" {
  default = "kyve"
}

terraform {
  backend "s3" {
    bucket = "kyve-terraform-state-use1"
    key    = "vpc/main.tfstate"
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
