provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id    = var.hcp_project_id
}

module "consul" {
  source = "./hcp_consul_vpc"
}

# module "ec2_instance" {
#   source = "./datacenter-deploy-ec2-hcp"
#   vpc_id = consul.vpc_id
#   vpc_cidr_block = consul.vpc_cidr_block
#   subnet_id = consul.vpc_subnet_id
#   cluster_id = consul.consul_cluster_id
#   hcp_consul_security_group_id = consul.hcp_consul_security_group_id
# }