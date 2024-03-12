resource "aws_route_table" "kyve-pub" {
  vpc_id = module.vpc-kyve.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc-kyve.vpc_igw
  }

#   route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }

  tags = {
    Name = "kyve-pub"
  }
}

resource "aws_route_table_association" "pub-a" {
  subnet_id      = module.vpc-kyve.subnet_public_1a_id
  route_table_id = aws_route_table.kyve-pub.id
}

resource "aws_route_table_association" "pub-b" {
  subnet_id      = module.vpc-kyve.subnet_public_1b_id
  route_table_id = aws_route_table.kyve-pub.id
}

resource "aws_route_table_association" "pub-c" {
  subnet_id      = module.vpc-kyve.subnet_public_1c_id
  route_table_id = aws_route_table.kyve-pub.id
}



resource "aws_route_table" "kyve-private" {
  vpc_id = module.vpc-kyve.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = module.vpc-kyve.vpc_nat
  }

  tags = {
    Name = "kyve-private"
  }
}

resource "aws_route_table_association" "private-a" {
  subnet_id      = module.vpc-kyve.subnet_private_1a_id
  route_table_id = aws_route_table.kyve-private.id
}

resource "aws_route_table_association" "private-b" {
  subnet_id      = module.vpc-kyve.subnet_private_1b_id
  route_table_id = aws_route_table.kyve-private.id
}

resource "aws_route_table_association" "private-c" {
  subnet_id      = module.vpc-kyve.subnet_private_1c_id
  route_table_id = aws_route_table.kyve-private.id
}