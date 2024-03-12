module "kyve-sentry-01" {
  source                        = "../modules//ec2/singleton"
  env                           = "kyve"
  iam_profile                   = "${data.terraform_remote_state.global.outputs.iam_profile_deployed}"
  aws_region                    = "${data.terraform_remote_state.global.outputs.aws_region}"
  aws_ami                       = "${data.terraform_remote_state.global.outputs.ubuntu20_ami}"
  aws_keypair_name              = "${data.terraform_remote_state.global.outputs.aws_keypair_name}"
  subnet_availability_zone      = "${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.a.zone}"
  subnet_id                     = "${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.a.id}"
  subnet_name                   = "${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.a.name}"
  vpc_id                        = "${data.terraform_remote_state.vpc.outputs.vpc_kyve.id}"
  disable_api_termination       = true
  monitoring                    = false
  associate_public_ip_address   = false
  ebs_optimized                 = true
  app_class                     = "node"
  app_role                      = "sentry"
  instance_type                 = "t3.small"
  instance_name_tag_prefix      = "kyve-sentry"
  root_block_device_volume_type = "gp2"
  security_group_description    = "kyve-sentry-${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.a.name}-${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.a.zone}"
  source_dest_check             = true
  root_block_device_volume_size = 50
  ## Ingress ssh default access should only be from kyve where you vpn lives. can further lock this down by using vpn subnet ##
  # if you did not yet launch a vpn feel free to change this in console to your ip address, jsut note it will overwrite when you tf apply #
  internal_cidr_blocks          = "${data.terraform_remote_state.global.outputs.kyve_cidr_prefix}.0.0/16"
}

module "kyve-sentry-02" {
  source                        = "../modules//ec2/singleton"
  env                           = "kyve"
  iam_profile                   = "${data.terraform_remote_state.global.outputs.iam_profile_deployed}"
  aws_region                    = "${data.terraform_remote_state.global.outputs.aws_region}"
  aws_ami                       = "${data.terraform_remote_state.global.outputs.ubuntu20_ami}"
  aws_keypair_name              = "${data.terraform_remote_state.global.outputs.aws_keypair_name}"
  subnet_availability_zone      = "${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.b.zone}"
  subnet_id                     = "${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.b.id}"
  subnet_name                   = "${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.b.name}"
  vpc_id                        = "${data.terraform_remote_state.vpc.outputs.vpc_kyve.id}"
  disable_api_termination       = true
  monitoring                    = false
  associate_public_ip_address   = false
  ebs_optimized                 = true
  app_class                     = "node"
  app_role                      = "sentry"
  instance_type                 = "t3.small"
  instance_name_tag_prefix      = "kyve-sentry"
  root_block_device_volume_type = "gp2"
  security_group_description    = "kyve-sentry-${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.b.name}-${data.terraform_remote_state.vpc.outputs.subnet_public_kyve.b.zone}"
  source_dest_check             = true
  root_block_device_volume_size = 50
  ## Ingress ssh default access should only be from kyve where you vpn lives. can further lock this down by using vpn subnet ##
  # if you did not yet launch a vpn feel free to change this in console to your ip address, jsut note it will overwrite when you tf apply #
  internal_cidr_blocks          = "${data.terraform_remote_state.global.outputs.kyve_cidr_prefix}.0.0/16"
}