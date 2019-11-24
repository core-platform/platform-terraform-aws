module "my_vpc" {
  source = "./modules/vpc"
  vpc_cidr = "192.168.0.0/16"
  vpc_tenancy = "default"
  vpc_id =  "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  ami_id = "ami-00dc79254d0461090"
  source = "./modules/ec2"
  ec2_count = "1"
  instance_type = "t2.micro"
  instance_subnet_id = "${module.my_vpc.subnet_id}"
  
}

