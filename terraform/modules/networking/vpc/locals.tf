locals {
  # ==============================================================
  # Base Tags
  # ==============================================================
  # Shared tags applied to all resources in this network module
  common_tags = {
    ManagedBy   = "Terraform"
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
  }

  # ==============================================================
  # Resource-Specific Tags
  # ==============================================================
  # Merges the base tags with specific module/type identifiers
  vpc_tags            = merge(local.common_tags, { Module = "vpc" })
  igw_tags            = merge(local.common_tags, { Module = "igw" })
  ngw_tags            = merge(local.common_tags, { Module = "ngw" })
  private_rt_tags     = merge(local.common_tags, { Module = "private-route-table" })
  public_rt_tags      = merge(local.common_tags, { Module = "public-route-table" })

  private_subnet_tags = merge(local.common_tags, {
    Module     = "private-subnet"
    SubnetType = "private"
  })

  public_subnet_tags  = merge(local.common_tags, {
    Module     = "public-subnet"
    SubnetType = "public"
  })

  # ==============================================================
  # Route Table Associations
  # ==============================================================

  # Flatten route table to subnet associations for PRIVATE subnets
  private_rt_subnet_associations = merge([
    for rt_key, rt_config in var.private_route_table_configs : {
      for subnet_key in rt_config.associated_private_subnets :
      "${rt_key}-${subnet_key}" => {
        route_table_key = rt_key
        subnet_key      = subnet_key
      }
    }
  ]...)

  # Flatten route table to subnet associations for PUBLIC subnets
  public_rt_subnet_associations = merge([
    for rt_key, rt_config in var.public_route_table_configs : {
      for subnet_key in rt_config.associated_public_subnets :
      "${rt_key}-${subnet_key}" => {
        route_table_key = rt_key
        subnet_key      = subnet_key
      }
    }
  ]...)
}
