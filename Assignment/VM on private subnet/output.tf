# modules/vm/main.tf

variable "subnet_id" {
  type = string
}

variable "ami" {
  type = string
}

resource "aws_instance" "vm" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.private_ip
  }

  provisioner "remote-exec" {
    inline = [
      "curl https://example.com",
    ]
  }

  tags = {
    Name = "private-vm"
  }
}
