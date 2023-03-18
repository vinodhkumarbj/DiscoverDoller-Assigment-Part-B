# main.tf

module "subnets" {
  source = "./modules/subnets"

  vpc_id            = "vpc-12345"
  public_cidr_block = "10.0.1.0/24"
  private_cidr_block = "10.0.2.0/24"
}
