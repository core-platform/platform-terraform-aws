module "my_vpc" {
  source = "./modules/network/vpc_module"
  vpc_cidr = "192.168.0.0/16"
  vpc_tenancy = "default"
  vpc_id =  "${module.my_vpc.vpc_id}"
}
module "my_subnet" {
  source = "./modules/network/subnet_module"
  subnet_cidr = "192.168.1.0/24"
  subnet_vpc_id =  "${module.my_vpc.vpc_id}"
}
module "my_ec2" {
  ami_id = "ami-00dc79254d0461090"
  source = "./modules/application/ec2_instance_module"
  ec2_count = "1"
  instance_type = "t2.micro"
  instance_subnet_id = "${module.my_subnet.subnet_id}"
}
