output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_nat" {
  value = aws_nat_gateway.vpc_nat.id
}

output "vpc_igw" {
  value = aws_internet_gateway.vpc.id
}

# private
output "subnet_private_1a_id" {
  value = aws_subnet.private-1a.id
}

output "subnet_private_1b_id" {
  value = aws_subnet.private-1b.id
}

output "subnet_private_1c_id" {
  value = aws_subnet.private-1c.id
}

output "subnet_private_1a_name" {
  value = aws_subnet.private-1a.tags.Name
}

output "subnet_private_1b_name" {
  value = aws_subnet.private-1b.tags.Name
}

output "subnet_private_1c_name" {
  value = aws_subnet.private-1c.tags.Name
}

output "subnet_private_1a_zone" {
  value = aws_subnet.private-1a.availability_zone
}

output "subnet_private_1b_zone" {
  value = aws_subnet.private-1b.availability_zone
}

output "subnet_private_1c_zone" {
  value = aws_subnet.private-1c.availability_zone
}

# protected
output "subnet_protected_1a_id" {
  value = aws_subnet.protected-1a.id
}

output "subnet_protected_1b_id" {
  value = aws_subnet.protected-1b.id
}

output "subnet_protected_1c_id" {
  value = aws_subnet.protected-1c.id
}

output "subnet_protected_1a_name" {
  value = aws_subnet.protected-1a.tags.Name
}

output "subnet_protected_1b_name" {
  value = aws_subnet.protected-1b.tags.Name
}

output "subnet_protected_1c_name" {
  value = aws_subnet.protected-1c.tags.Name
}

output "subnet_protected_1a_zone" {
  value = aws_subnet.protected-1a.availability_zone
}

output "subnet_protected_1b_zone" {
  value = aws_subnet.protected-1b.availability_zone
}

output "subnet_protected_1c_zone" {
  value = aws_subnet.protected-1c.availability_zone
}

# public
output "subnet_public_1a_id" {
  value = aws_subnet.public-1a.id
}

output "subnet_public_1b_id" {
  value = aws_subnet.public-1b.id
}

output "subnet_public_1c_id" {
  value = aws_subnet.public-1c.id
}

output "subnet_public_1a_name" {
  value = aws_subnet.public-1a.tags.Name
}

output "subnet_public_1b_name" {
  value = aws_subnet.public-1b.tags.Name
}

output "subnet_public_1c_name" {
  value = aws_subnet.public-1c.tags.Name
}

output "subnet_public_1a_zone" {
  value = aws_subnet.public-1a.availability_zone
}

output "subnet_public_1b_zone" {
  value = aws_subnet.public-1b.availability_zone
}

output "subnet_public_1c_zone" {
  value = aws_subnet.public-1c.availability_zone
}