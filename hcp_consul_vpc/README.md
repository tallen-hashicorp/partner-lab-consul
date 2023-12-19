<!-- BEGIN_TF_DOCS -->
## Overview
This Terraform configuration is designed to provision the foundational infrastructure for a partner environment on HashiCorp Cloud Platform (HCP). The infrastructure includes a Virtual Private Cloud (VPC), HashiCorp Consul Cluster, and necessary networking components to establish a secure and scalable partner environment

## Components

### VPC (Virtual Private Cloud):
- A dedicated VPC with a specified CIDR block to isolate and organize network resources.
- Subnet for HashiCorp Consul deployment within the VPC.
- Internet Gateway to enable communication with the external world.

### HCP HVN (HashiCorp Virtual Network):
- The HashiCorp Virtual Network (HVN) is created to serve as the foundation for HCP services.
- Network peering connection to connect the HVN with the partner's AWS VPC.

### Consul Cluster:
- An empty HashiCorp Consul Cluster is provisioned within

Certainly! Here are the requirements and recommended environment variables for deploying the Terraform configuration:

## Requirements

- **AWS Account:**
  - An active AWS account is required to provision the infrastructure components.
  - Ensure that the AWS access credentials provided have sufficient permissions to create VPCs, subnets, security groups, and other necessary resources.

- **HCP Account:**
  - A HashiCorp Cloud Platform (HCP) account is necessary to create the HashiCorp Virtual Network (HVN) and deploy the Consul Cluster.
  - Obtain the following HCP account details:
    - `hcp_client_id`: Your HCP client ID.
    - `hcp_client_secret`: The HCP client secret key generated for your account.
    - `hcp_project_id`: The HCP project key associated with your account.

## Recommended Environment Variables:

To streamline the Terraform deployment process, it is recommended to set the following environment variables:

```bash
export TF_VAR_hcp_client_id=<your HCP client id>
export TF_VAR_hcp_client_secret=<your HCP client secret>
export TF_VAR_hcp_project_id=<your HCP project id>
export AWS_ACCESS_KEY_ID=<your AWS access key id>
export AWS_SECRET_ACCESS_KEY=<your AWS secret access key>
export AWS_SESSION_TOKEN=<your AWS session token>
```

- `TF_VAR_hcp_client_id`: Your HashiCorp Cloud Platform client ID.
- `TF_VAR_hcp_client_secret`: The client secret key associated with your HCP account.
- `TF_VAR_hcp_project_id`: The project key for your HCP account.
- `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `AWS_SESSION_TOKEN`: Your AWS session token (if using temporary security credentials).

Ensure that these environment variables are set before running the Terraform commands to simplify the authentication and configuration process.

## Providers

| Name | Version |
|------|---------|
| [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) | n/a |
| [hcp](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.gw_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.peer_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_security_group.hcp_consul](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.allow_all_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_lan_consul_gossip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.peer_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_peering_connection_accepter.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [hcp_aws_network_peering.peer](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_network_peering) | resource |
| [hcp_consul_cluster.partner_hcp](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_cluster) | resource |
| [hcp_hvn.partner_hvn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn) | resource |
| [hcp_hvn_route.peer_route](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn_route) | resource |
| [aws_arn.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) | data source |
| [aws_route_table.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | The cloud provider of the HCP HVN and Consul cluster. | `string` | `"aws"` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the HCP Consul cluster. | `string` | `"partner-hcp-consul"` | no |
| <a name="input_hvn_id"></a> [hvn\_id](#input\_hvn\_id) | The ID of the HCP HVN. | `string` | `"partner-hvn"` | no |
| <a name="input_peering_id"></a> [peering\_id](#input\_peering\_id) | The ID of the HCP peering connection. | `string` | `"partner-peering"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the HCP HVN and Consul cluster. | `string` | `"us-west-2"` | no |
| <a name="input_route_id"></a> [route\_id](#input\_route\_id) | The ID of the HCP HVN route. | `string` | `"partner-hvn-route"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | The ID of the AWS security group. |
| <a name="output_consul_ca_file"></a> [consul\_ca\_file](#output\_consul\_ca\_file) | The CA file for Consul. |
| <a name="output_consul_cluster_id"></a> [consul\_cluster\_id](#output\_consul\_cluster\_id) | The ID of the Consul cluster. |
| <a name="output_consul_config_file"></a> [consul\_config\_file](#output\_consul\_config\_file) | The configuration file for Consul. |
| <a name="output_consul_private_endpoint_url"></a> [consul\_private\_endpoint\_url](#output\_consul\_private\_endpoint\_url) | The private endpoint URL for Consul. |
| <a name="output_consul_region"></a> [consul\_region](#output\_consul\_region) | The region of the Consul cluster. |
| <a name="output_consul_root_token_accessor_id"></a> [consul\_root\_token\_accessor\_id](#output\_consul\_root\_token\_accessor\_id) | The accessor ID for the Consul root token. |
| <a name="output_consul_root_token_secret_id"></a> [consul\_root\_token\_secret\_id](#output\_consul\_root\_token\_secret\_id) | The secret ID for the Consul root token. |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC. |
| <a name="output_vpc_subnet_id"></a> [vpc\_subnet\_id](#output\_vpc\_subnet\_id) | The ID of the VPC subnet. |
<!-- END_TF_DOCS -->"
