## Overview

This Terraform script facilitates the deployment of EC2 instances within an existing HashiCorp Consul Service on HashiCorp Cloud Platform (HCP) environment. The script is designed for partner environments where HCP Consul is already set up. The EC2 instances are provisioned without running specific services, allowing them to seamlessly integrate with the existing HCP Consul cluster.

## Purpose

The primary purpose of this Terraform configuration is to automate the deployment of EC2 instances that can serve as clients within an established HCP Consul environment. These instances are configured to connect to the existing Consul cluster, promoting a simplified and standardized approach to infrastructure provisioning.

## Components

### AWS Resources
- **EC2 Instances:** Deployed instances tailored for connecting to the HCP Consul cluster.
- **Security Group:** Allows SSH inbound traffic to the EC2 instances.
- **VPC and Subnet:** Networking components necessary for EC2 deployment.

### HashiCorp Cloud Platform (HCP) Resources
- **Consul Cluster:** Retrieves information about the existing HCP Consul cluster.
- **Consul Root Token:** Fetches the root ACL token, ensuring secure communication with Consul.

## Requirements

### HashiCorp Cloud Platform (HCP) Cluster Setup

The following will be created using the HCP-Internal-Consul module

1. **HCP Consul Cluster:** Ensure that a HashiCorp Consul Service cluster is provisioned and running on HashiCorp Cloud Platform (HCP). The script assumes the availability of a functioning Consul cluster.

2. **Consul Cluster ID (cluster_id):** Identify the unique identifier for the HCP Consul cluster to which the EC2 instances will connect. This is a required input for the Terraform script.

### AWS Environment Setup

3. **AWS Account:** Access to an AWS account with the necessary permissions to create EC2 instances, security groups, VPC components, and establish VPC peering connections.

4. **AWS VPC and Subnet:** Define the AWS VPC and subnet details where the EC2 instances will be deployed. The script requires VPC and subnet IDs as inputs.

5. **AWS Security Group:** Set up an AWS Security Group allowing inbound SSH traffic to the EC2 instances. The security group ID is a required input.

6. **AWS Credentials:** Ensure that AWS credentials are configured either through environment variables, AWS CLI profiles, or other preferred methods.

### VPC Peering Setup

7. **VPC Peering Connection:** Establish VPC peering connections between the VPC hosting the HCP Consul cluster and the VPC where the EC2 instances will be deployed. Ensure the necessary route table entries for seamless communication.

### Recommended Environment Variables

To enhance configurability and security, consider using environment variables for sensitive information:

- `TF_VAR_cluster_id`: HCP Consul cluster ID.
- `TF_VAR_hcp_consul_security_group_id`: AWS Security group ID for HCP Consul.
- `TF_VAR_instance_count`: Number of EC2 instances to deploy.
- `TF_VAR_subnet_id`: AWS subnet ID for EC2 deployment.
- `TF_VAR_vpc_cidr_block`: CIDR block for the AWS VPC.
- `TF_VAR_vpc_id`: AWS VPC ID.

Ensure these environment variables are set or exported before running the Terraform script.

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
