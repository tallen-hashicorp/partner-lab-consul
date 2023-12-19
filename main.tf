provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id    = var.hcp_project_id
}

module "consul" {
  source        = "./hcp_consul_vpc"
  hvn_id        = "gft-partner-hvn"
  cluster_id    = "gft-patner-hcp-consul"
}

module "ec2_instance" {
  instance_count = 1
  source = "./datacenter-deploy-ec2-hcp"
  vpc_id = module.consul.vpc_id
  vpc_cidr_block = module.consul.vpc_cidr_block
  subnet_id = module.consul.vpc_subnet_id
  cluster_id = module.consul.consul_cluster_id
  hcp_consul_security_group_id = module.consul.aws_security_group_id
}