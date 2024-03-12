# Outputs
output "instance_assume_role_policy" {
  value = data.aws_iam_policy_document.instance_assume_role_policy.json
}

output "aws_iam_instance_profile_deployed" {
  value = aws_iam_instance_profile.deployed.name
}

output "aws_iam_instance_profile_deployed_id" {
  value = aws_iam_instance_profile.deployed.id
}