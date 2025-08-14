resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = var.tags
}

data "aws_availability_zones" "available" {}

# higher availability
resource "aws_subnet" "private_subnet_0" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_0_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_1_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
}

resource "aws_vpc_endpoint" "s3" {
  count             = var.vpc_endpoint_type == "Gateway" ? 1 : 0
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = var.vpc_endpoint_type
  route_table_ids   = [aws_vpc.main.main_route_table_id]
}

resource "aws_vpc_endpoint" "dynamodb" {
  count             = var.vpc_endpoint_type == "Gateway" ? 1 : 0
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = var.vpc_endpoint_type
  route_table_ids   = [aws_vpc.main.main_route_table_id]
}

resource "aws_security_group" "security_group" {
  count       = var.vpc_endpoint_type == "Gateway" ? 1 : 0
  name        = "shared_security_group"
  description = "shared security group"
  vpc_id      = aws_vpc.main.id

  egress {
    description     = "Allow outbound to AWS S3 service"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [aws_vpc_endpoint.s3[count.index].prefix_list_id]
  }

  egress {
    description     = "Allow outbound to AWS Dynamo DB service"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [aws_vpc_endpoint.dynamodb[count.index].prefix_list_id]
  }

  tags = var.tags
}

resource "aws_network_acl" "private_nacl" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.private_subnet_0.id, aws_subnet.private_subnet_1.id]
}

resource "aws_network_acl_rule" "nacl_rules" {
  for_each = {
    for rule in var.nacl_rules : "${rule.egress}-${rule.rule_number}" => rule
  }

  network_acl_id = aws_network_acl.private_nacl.id

  rule_number = each.value.rule_number
  protocol    = each.value.protocol
  rule_action = each.value.rule_action
  egress      = each.value.egress
  cidr_block  = each.value.cidr_block
  from_port   = each.value.from_port
  to_port     = each.value.to_port
}
