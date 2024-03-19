resource "aws_vpc" "vpc_tooling" {
  cidr_block           = "10.8.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "local.vpc_name"
  }
}

# resource "aws_internet_gateway" "igw_tooling" {
#   vpc_id = aws_vpc.vpc_tooling.id
#     tags = {
#         Name = "local.ig_name"
#     }

# }
