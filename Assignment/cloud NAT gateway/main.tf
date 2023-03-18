# main.tf

module "nat" {
  source = "./modules/nat"

  vpc_id            = "vpc-12345"
  private_subnet_id = "subnet-67890"
}
