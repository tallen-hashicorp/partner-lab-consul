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
| [aws_instance.consul_client](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [hcp_consul_cluster_root_token.token](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_cluster_root_token) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [hcp_consul_cluster.selected](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/consul_cluster) | data source |
| [hcp_hvn.selected](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/hvn) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | HCP Consul ID | `string` | n/a | yes |
| <a name="input_hcp_consul_security_group_id"></a> [hcp\_consul\_security\_group\_id](#input\_hcp\_consul\_security\_group\_id) | AWS Security group for HCP Consul | `string` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | value for EC2 instance count | `number` | `1` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | AWS subnet (public) | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | AWS CIDR block | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | AWS VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_consul_root_token"></a> [consul\_root\_token](#output\_consul\_root\_token) | HCP Consul root ACL token |
| <a name="output_consul_url"></a> [consul\_url](#output\_consul\_url) | HCP Consul UI |
| <a name="output_ec2_client"></a> [ec2\_client](#output\_ec2\_client) | EC2 public IP |
| <a name="output_next_steps"></a> [next\_steps](#output\_next\_steps) | n/a |
<!-- END_TF_DOCS -->