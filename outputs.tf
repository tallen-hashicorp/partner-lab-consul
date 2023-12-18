output "vpc_id" {
  value = module.consul.vpc_id
}

output "consul_ca_file" {
  value = module.consul.consul_ca_file
}

output "consul_config_file" {
  value = module.consul.consul_config_file
}

output "consul_private_endpoint_url" {
  value = module.consul.consul_private_endpoint_url
}

output "consul_root_token_accessor_id" {
  value = module.consul.consul_root_token_accessor_id
}

output "consul_root_token_secret_id" {
  value = module.consul.consul_root_token_secret_id
  sensitive = true
}

output "consul_cluster_id" {
  value = module.consul.consul_cluster_id
}

output "consul_region" {
  value = module.consul.consul_region
}

output "vpc_cidr_block" {
  value = module.consul.vpc_cidr_block
}

output "vpc_subnet_id" {
  value = module.consul.vpc_subnet_id
}

output "aws_security_group_id" {
  value = module.consul.aws_security_group_id
}