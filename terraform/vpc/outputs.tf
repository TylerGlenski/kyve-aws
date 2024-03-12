output "subnet_protected_kyve" {
  value = tomap({
    "a" = tomap({
      "id"   = "${module.vpc-kyve.subnet_protected_1a_id}",
      "name" = "${module.vpc-kyve.subnet_protected_1a_name}",
      "zone" = "${module.vpc-kyve.subnet_protected_1a_zone}"
    }),
    "b" = tomap({
      "id"   = "${module.vpc-kyve.subnet_protected_1b_id}",
      "name" = "${module.vpc-kyve.subnet_protected_1b_name}",
      "zone" = "${module.vpc-kyve.subnet_protected_1b_zone}"
    }),
    "c" = tomap({
      "id"   = "${module.vpc-kyve.subnet_protected_1c_id}",
      "name" = "${module.vpc-kyve.subnet_protected_1c_name}",
      "zone" = "${module.vpc-kyve.subnet_protected_1c_zone}"
    }),
  })
}

output "subnet_private_kyve" {
  value = tomap({
    "a" = tomap({
      "id"   = "${module.vpc-kyve.subnet_private_1a_id}",
      "name" = "${module.vpc-kyve.subnet_private_1a_name}",
      "zone" = "${module.vpc-kyve.subnet_private_1a_zone}"
    }),
    "b" = tomap({
      "id"   = "${module.vpc-kyve.subnet_private_1b_id}",
      "name" = "${module.vpc-kyve.subnet_private_1b_name}",
      "zone" = "${module.vpc-kyve.subnet_private_1b_zone}"
    }),
    "c" = tomap({
      "id"   = "${module.vpc-kyve.subnet_private_1c_id}",
      "name" = "${module.vpc-kyve.subnet_private_1c_name}",
      "zone" = "${module.vpc-kyve.subnet_private_1c_zone}"
    }),
  })
}

output "subnet_public_kyve" {
  value = tomap({
    "a" = tomap({
      "id"   = "${module.vpc-kyve.subnet_public_1a_id}",
      "name" = "${module.vpc-kyve.subnet_public_1a_name}",
      "zone" = "${module.vpc-kyve.subnet_public_1a_zone}"
    }),
    "b" = tomap({
      "id"   = "${module.vpc-kyve.subnet_public_1b_id}",
      "name" = "${module.vpc-kyve.subnet_public_1b_name}",
      "zone" = "${module.vpc-kyve.subnet_public_1b_zone}"
    }),
    "c" = tomap({
      "id"   = "${module.vpc-kyve.subnet_public_1c_id}",
      "name" = "${module.vpc-kyve.subnet_public_1c_name}",
      "zone" = "${module.vpc-kyve.subnet_public_1c_zone}"
    }),
  })
}

output "vpc_kyve" {
  value = tomap({
    "cidr" = "${data.terraform_remote_state.global.outputs.kyve_cidr_prefix}.0.0/16",
    "id"   = "${module.vpc-kyve.vpc_id}",
    "nat"  = "${module.vpc-kyve.vpc_nat}",
    "igw"  = "${module.vpc-kyve.vpc_igw}"
  })
}