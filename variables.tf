variable "vpc_endpoint_type" {
  type    = string
  default = "Gateway"
}

variable "region" {
  type        = string
  description = "The AWS region in which to deploy"
  default     = "eu-west-2"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block range to allocate to the VPC"
  default     = "10.0.0.0/16"
}

variable "nacl_rules" {
  description = "List of ingress and egress NACL rules"
  type = list(object({
    rule_number = number
    protocol    = string
    rule_action = string
    egress      = bool
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
}
