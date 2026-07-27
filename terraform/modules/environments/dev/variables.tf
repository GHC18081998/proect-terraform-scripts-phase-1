variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "owner" {
  description = "Owner team"
  type        = string
}

# ---- VPC Configuration ----
variable "vpc_configs" {
  description = "VPC configurations for this environment. Add more VPCs by adding entries."
  type = map(object({
    cidr_block           = string
    enable_dns_hostnames = optional(bool, true)
    enable_dns_support   = optional(bool, true)
    instance_tenancy     = optional(string, "default")
    tags                 = optional(map(string), {})
  }))
}

# ---- Public Subnet Configuration ----
variable "public_subnet_configs" {
  description = "Public subnet configurations"
  type = map(object({
    vpc_key           = string
    cidr_block        = string
    availability_zone = string
    map_public_ip     = optional(bool, true)
    tags              = optional(map(string), {})
  }))
}

# ---- Private Subnet Configuration ----
variable "private_subnet_configs" {
  description = "Private subnet configurations"
  type = map(object({
    vpc_key           = string
    cidr_block        = string
    availability_zone = string
    subnet_type       = optional(string, "app")
    tags              = optional(map(string), {})
  }))
}

# ---- NAT Gateway Configuration ----
variable "nat_gateway_configs" {
  description = "NAT Gateway configurations"
  type = map(object({
    public_subnet_key = string
    tags              = optional(map(string), {})
  }))
}

# ---- Public Route Table Configuration ----
variable "public_route_table_configs" {
  description = "Public route table configurations"
  type = map(object({
    vpc_key                   = string
    igw_key                   = string
    associated_public_subnets = list(string)
    tags                      = optional(map(string), {})
  }))
}

# ---- Private Route Table Configuration ----
variable "private_route_table_configs" {
  description = "Private route table configurations"
  type = map(object({
    vpc_key                    = string
    nat_gateway_key            = string
    associated_private_subnets = list(string)
    tags                       = optional(map(string), {})
  }))
}
