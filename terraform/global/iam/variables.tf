terraform {
  backend "s3" {
    bucket = "kyve-terraform-state-use1"
    key    = "global/iam/main.tfstate"
  }
}