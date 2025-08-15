variable "vpc_endpoint_type" {
  type        = string
  description = "The type of VPC endpoint, which can be either Interface or Gateway"
  default     = "Gateway"
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

# TODO: Make iterable
variable "subnet_0_cidr" {
  type        = string
  description = "The CIDR block range to allocate to the VPC"
  default     = "10.0.0.0/24"
}

variable "subnet_1_cidr" {
  type        = string
  description = "The secondary CIDR block range to allocate to the VPC"
  default     = "10.0.1.0/24"
}

variable "tags" {
  type        = map(any)
  description = "The project tags"
}

variable "nacl_rules" {
  type = list(object({
    rule_number = number
    protocol    = string
    rule_action = string
    egress      = bool
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
  description = "List of ingress and egress NACL rules"
}
