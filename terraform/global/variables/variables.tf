terraform {
  backend "s3" {
    bucket = "kyve-terraform-state-use1"
    key    = "global/variables/main.tfstate"
  }
}