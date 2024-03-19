# Création des subnets privés
resource "aws_subnet" "private_subnets" {
  count             = 2
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = "eu-west-3a"
}

# Création des subnets publics
resource "aws_subnet" "public_subnets" {
  count             = 2
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.${count.index + 2}.0/24"
  availability_zone = "eu-west-3b"
}
