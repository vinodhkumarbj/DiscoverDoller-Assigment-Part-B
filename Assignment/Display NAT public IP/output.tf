# modules/nat_ip/main.tf

variable "subnet_id" {
  type = string
}

resource "aws_instance" "nat_ip" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  provisioner "local-exec" {
    command = "echo ${aws_eip.nat.public_ip} > nat_ip.txt"
  }

  tags = {
    Name = "nat-ip-vm"
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

output "nat_public_ip" {
  value = aws_eip.nat.public_ip
}
