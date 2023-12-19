<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | n/a |

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
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | n/a |
| <a name="output_consul_ca_file"></a> [consul\_ca\_file](#output\_consul\_ca\_file) | n/a |
| <a name="output_consul_cluster_id"></a> [consul\_cluster\_id](#output\_consul\_cluster\_id) | n/a |
| <a name="output_consul_config_file"></a> [consul\_config\_file](#output\_consul\_config\_file) | n/a |
| <a name="output_consul_private_endpoint_url"></a> [consul\_private\_endpoint\_url](#output\_consul\_private\_endpoint\_url) | n/a |
| <a name="output_consul_region"></a> [consul\_region](#output\_consul\_region) | n/a |
| <a name="output_consul_root_token_accessor_id"></a> [consul\_root\_token\_accessor\_id](#output\_consul\_root\_token\_accessor\_id) | n/a |
| <a name="output_consul_root_token_secret_id"></a> [consul\_root\_token\_secret\_id](#output\_consul\_root\_token\_secret\_id) | n/a |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_subnet_id"></a> [vpc\_subnet\_id](#output\_vpc\_subnet\_id) | n/a |
<!-- END_TF_DOCS -->