## Overview

This Terraform script facilitates the deployment of EC2 instances within an existing HashiCorp Consul Service on HashiCorp Cloud Platform (HCP) environment. The script is designed for partner environments where HCP Consul is already set up. The EC2 instances are provisioned without running specific services, allowing them to seamlessly integrate with the existing HCP Consul cluster.

## Purpose

The primary purpose of this Terraform configuration is to automate the deployment of EC2 instances that can serve as clients within an established HCP Consul environment. These instances are configured to connect to the existing Consul cluster, promoting a simplified and standardized approach to infrastructure provisioning.

## Requirements

No specific requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | >= 0.22 |

## Modules

No modules used.

## Resources

| Name | Type |
|------|------|
| [aws_instance.consul_client](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | AWS EC2 Instance |
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | AWS Security Group |
| [hcp_consul_cluster_root_token.token](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_cluster_root_token) | HCP Consul Root Token |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | AWS AMI (Ubuntu) |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | AWS Subnet |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | AWS VPC |
| [hcp_consul_cluster.selected](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/consul_cluster) | HCP Consul Cluster |
| [hcp_hvn.selected](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/hvn) | HCP HashiCorp Virtual Network |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | HCP Consul ID | `string` | - | yes |
| <a name="input_hcp_consul_security_group_id"></a> [hcp\_consul\_security\_group\_id](#input\_hcp\_consul\_security\_group\_id) | AWS Security group for HCP Consul | `string` | - | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of EC2 instances to create | `number` | `1` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | AWS subnet (public) | `string` | - | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | AWS CIDR block for VPC | `string` | - | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | AWS VPC ID | `string` | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_consul_root_token"></a> [consul\_root\_token](#output\_consul\_root\_token) | HCP Consul Root ACL Token |
| <a name="output_consul_url"></a> [consul\_url](#output\_consul\_url) | URL for accessing HCP Consul UI |
| <a name="output_ec2_client"></a> [ec2\_client](#output\_ec2\_client) | Public IP address of the EC2 instance |
| <a name="output_next_steps"></a> [next\_steps](#output\_next\_steps) | Instructions for the next steps after deployment |
