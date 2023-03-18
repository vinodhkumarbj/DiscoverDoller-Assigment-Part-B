# main.tf

module "nat_ip" {
  source = "./modules/nat_ip"

  subnet_id = "subnet-12345"
}
