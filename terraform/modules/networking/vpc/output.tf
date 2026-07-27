# ==============================================================
# VPC Outputs
# ==============================================================

output "vpc_ids" {
  description = "Map of VPC name to VPC ID"
  value       = { for k, v in aws_vpc.this : k => v.id }
}

output "vpc_arns" {
  description = "Map of VPC name to VPC ARN"
  value       = { for k, v in aws_vpc.this : k => v.arn }
}

output "vpc_cidr_blocks" {
  description = "Map of VPC name to CIDR block"
  value       = { for k, v in aws_vpc.this : k => v.cidr_block }
}

output "vpc_details" {
  description = "Complete VPC details map"
  value = {
    for k, v in aws_vpc.this : k => {
      id                   = v.id
      arn                  = v.arn
      cidr_block           = v.cidr_block
      enable_dns_hostnames = v.enable_dns_hostnames
      enable_dns_support   = v.enable_dns_support
    }
  }
}

# ==============================================================
# Internet Gateway Outputs
# ==============================================================

output "igw_ids" {
  description = "Map of VPC name to Internet Gateway ID"
  value       = { for k, v in aws_internet_gateway.this : k => v.id }
}

output "igw_arns" {
  description = "Map of VPC name to Internet Gateway ARN"
  value       = { for k, v in aws_internet_gateway.this : k => v.arn }
}

# ==============================================================
# Public Subnet Outputs
# ==============================================================

output "public_subnet_ids" {
  description = "Map of subnet name to subnet ID"
  value       = { for k, v in aws_subnet.public : k => v.id }
}

output "public_subnet_arns" {
  description = "Map of subnet name to subnet ARN"
  value       = { for k, v in aws_subnet.public : k => v.arn }
}

output "public_subnet_cidr_blocks" {
  description = "Map of subnet name to CIDR block"
  value       = { for k, v in aws_subnet.public : k => v.cidr_block }
}

output "public_subnet_details" {
  description = "Complete public subnet details"
  value = {
    for k, v in aws_subnet.public : k => {
      id                = v.id
      arn               = v.arn
      cidr_block        = v.cidr_block
      availability_zone = v.availability_zone
      vpc_id            = v.vpc_id
    }
  }
}

# ==============================================================
# Private Subnet Outputs
# ==============================================================

output "private_subnet_ids" {
  description = "Map of subnet name to subnet ID"
  value       = { for k, v in aws_subnet.private : k => v.id }
}

output "private_subnet_arns" {
  description = "Map of subnet name to subnet ARN"
  value       = { for k, v in aws_subnet.private : k => v.arn }
}

output "private_subnet_cidr_blocks" {
  description = "Map of subnet name to CIDR block"
  value       = { for k, v in aws_subnet.private : k => v.cidr_block }
}

output "private_subnet_details" {
  description = "Complete private subnet details"
  value = {
    for k, v in aws_subnet.private : k => {
      id                = v.id
      arn               = v.arn
      cidr_block        = v.cidr_block
      availability_zone = v.availability_zone
      vpc_id            = v.vpc_id
    }
  }
}

# ==============================================================
# NAT Gateway & EIP Outputs
# ==============================================================

output "nat_gateway_ids" {
  description = "Map of NAT Gateway name to ID"
  value       = { for k, v in aws_nat_gateway.this : k => v.id }
}

output "nat_gateway_public_ips" {
  description = "Map of NAT Gateway name to public IP"
  value       = { for k, v in aws_nat_gateway.this : k => v.public_ip }
}

output "eip_ids" {
  description = "Map of EIP name to allocation ID"
  value       = { for k, v in aws_eip.nat : k => v.id }
}

output "eip_public_ips" {
  description = "Map of EIP name to public IP"
  value       = { for k, v in aws_eip.nat : k => v.public_ip }
}

# ==============================================================
# Public Route Table Outputs
# ==============================================================

output "public_route_table_ids" {
  description = "Map of route table name to ID"
  value       = { for k, v in aws_route_table.public : k => v.id }
}

output "public_route_table_arns" {
  description = "Map of route table name to ARN"
  value       = { for k, v in aws_route_table.public : k => v.arn }
}

output "public_route_table_association_ids" {
  description = "Map of association name to ID"
  value       = { for k, v in aws_route_table_association.public : k => v.id }
}

# ==============================================================
# Private Route Table Outputs
# ==============================================================

output "private_route_table_ids" {
  description = "Map of route table name to ID"
  value       = { for k, v in aws_route_table.private : k => v.id }
}

output "private_route_table_arns" {
  description = "Map of route table name to ARN"
  value       = { for k, v in aws_route_table.private : k => v.arn }
}

output "private_route_table_association_ids" {
  description = "Map of association name to ID"
  value       = { for k, v in aws_route_table_association.private : k => v.id }
}
