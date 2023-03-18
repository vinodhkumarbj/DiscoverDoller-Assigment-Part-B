# modules/subnets/main.tf

variable "vpc_id" {
  type = string
}

variable "public_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_cidr_block" {
  type    = string
  default = "10.0.2.0/24"
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_cidr_block
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr_block
  availability_zone = "us-west-2b"

  tags = {
    Name = "private-subnet"
  }
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
