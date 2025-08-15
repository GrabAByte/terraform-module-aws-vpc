<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_network_acl.private_nacl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl_rule.nacl_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_security_group.security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_subnet_0](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nacl_rules"></a> [nacl\_rules](#input\_nacl\_rules) | List of ingress and egress NACL rules | <pre>list(object({<br/>    rule_number = number<br/>    protocol    = string<br/>    rule_action = string<br/>    egress      = bool<br/>    cidr_block  = string<br/>    from_port   = number<br/>    to_port     = number<br/>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region in which to deploy | `string` | `"eu-west-2"` | no |
| <a name="input_subnet_0_cidr"></a> [subnet\_0\_cidr](#input\_subnet\_0\_cidr) | The CIDR block range to allocate to the VPC | `string` | `"10.0.0.0/24"` | no |
| <a name="input_subnet_1_cidr"></a> [subnet\_1\_cidr](#input\_subnet\_1\_cidr) | The secondary CIDR block range to allocate to the VPC | `string` | `"10.0.1.0/24"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The project tags | `map(any)` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The CIDR block range to allocate to the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_endpoint_type"></a> [vpc\_endpoint\_type](#input\_vpc\_endpoint\_type) | The type of VPC endpoint, which can be either Interface or Gateway | `string` | `"Gateway"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_groups"></a> [security\_groups](#output\_security\_groups) | n/a |
| <a name="output_vpc_subnet_0"></a> [vpc\_subnet\_0](#output\_vpc\_subnet\_0) | n/a |
| <a name="output_vpc_subnet_1"></a> [vpc\_subnet\_1](#output\_vpc\_subnet\_1) | n/a |
<!-- END_TF_DOCS -->