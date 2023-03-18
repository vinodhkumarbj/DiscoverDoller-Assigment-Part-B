# modules/nat/main.tf

variable "vpc_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.private_subnet_id

  depends_on = [
    aws_internet_gateway.igw
  ]
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private_route_table.id
}
