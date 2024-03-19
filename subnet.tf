resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.vpc_tooling.id
  cidr_block        = "10.8.0.0/16"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "public_subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.vpc_tooling.id
  cidr_block        = "10.8.0.0/16"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "public_subnet2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.vpc_tooling.id
  cidr_block        = "10.8.0.0/16"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "private_subnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.vpc_tooling.id
  cidr_block        = "10.8.0.0/16"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "private_subnet2"
  }
}
