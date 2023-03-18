# main.tf

module "vm" {
  source = "./modules/vm"

  subnet_id = "subnet-12345"
  ami       = "ami-67890"
}
