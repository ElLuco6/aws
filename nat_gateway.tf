# Création des NAT Gateways
resource "aws_nat_gateway" "nat" {
  count         = 2
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public_subnets[count.index].id
}

# Allocation des adresses IP Elastic pour les NAT Gateways
resource "aws_eip" "nat" {
  count = 2
}
