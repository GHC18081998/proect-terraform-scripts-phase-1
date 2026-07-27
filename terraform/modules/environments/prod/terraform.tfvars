# ==============================================================
# PROD Environment Configuration
# ==============================================================

aws_region   = "us-east-1"
project_name = "myproject"
environment  = "prod"
owner        = "aws-devops-team"

# --------------------------------------------------------------
# 4 VPCs
# --------------------------------------------------------------
vpc_configs = {
  "vpc-web" = { cidr_block = "10.10.0.0/16", enable_dns_hostnames = true, enable_dns_support = true }
  "vpc-app" = { cidr_block = "10.11.0.0/16", enable_dns_hostnames = true, enable_dns_support = true }
  "vpc-db"  = { cidr_block = "10.12.0.0/16", enable_dns_hostnames = true, enable_dns_support = true }
  "vpc-iso" = { cidr_block = "10.13.0.0/16", enable_dns_hostnames = true, enable_dns_support = true }
}

# --------------------------------------------------------------
# 6 Public Subnets 
# --------------------------------------------------------------
public_subnet_configs = {
  "web-pub-1a" = { vpc_key = "vpc-web", cidr_block = "10.10.1.0/24", availability_zone = "us-east-1a", map_public_ip = true }
  "web-pub-1b" = { vpc_key = "vpc-web", cidr_block = "10.10.2.0/24", availability_zone = "us-east-1b", map_public_ip = true }
  "app-pub-1a" = { vpc_key = "vpc-app", cidr_block = "10.11.1.0/24", availability_zone = "us-east-1a", map_public_ip = true }
  "app-pub-1b" = { vpc_key = "vpc-app", cidr_block = "10.11.2.0/24", availability_zone = "us-east-1b", map_public_ip = true }
  "db-pub-1a"  = { vpc_key = "vpc-db",  cidr_block = "10.12.1.0/24", availability_zone = "us-east-1a", map_public_ip = true }
  "db-pub-1b"  = { vpc_key = "vpc-db",  cidr_block = "10.12.2.0/24", availability_zone = "us-east-1b", map_public_ip = true }
}

# --------------------------------------------------------------
# 6 Private Subnets
# --------------------------------------------------------------
private_subnet_configs = {
  "web-priv-1a" = { vpc_key = "vpc-web", cidr_block = "10.10.10.0/24", availability_zone = "us-east-1a", subnet_type = "app" }
  "web-priv-1b" = { vpc_key = "vpc-web", cidr_block = "10.10.11.0/24", availability_zone = "us-east-1b", subnet_type = "app" }
  "app-priv-1a" = { vpc_key = "vpc-app", cidr_block = "10.11.10.0/24", availability_zone = "us-east-1a", subnet_type = "app" }
  "app-priv-1b" = { vpc_key = "vpc-app", cidr_block = "10.11.11.0/24", availability_zone = "us-east-1b", subnet_type = "app" }
  "db-priv-1a"  = { vpc_key = "vpc-db",  cidr_block = "10.12.10.0/24", availability_zone = "us-east-1a", subnet_type = "data" }
  "db-priv-1b"  = { vpc_key = "vpc-db",  cidr_block = "10.12.11.0/24", availability_zone = "us-east-1b", subnet_type = "data" }
}

# --------------------------------------------------------------
# 6 NAT Gateways
# --------------------------------------------------------------
nat_gateway_configs = {
  "web-nat-1a" = { public_subnet_key = "web-pub-1a" }
  "web-nat-1b" = { public_subnet_key = "web-pub-1b" }
  "app-nat-1a" = { public_subnet_key = "app-pub-1a" }
  "app-nat-1b" = { public_subnet_key = "app-pub-1b" }
  "db-nat-1a"  = { public_subnet_key = "db-pub-1a" }
  "db-nat-1b"  = { public_subnet_key = "db-pub-1b" }
}

# --------------------------------------------------------------
# 3 Public Route Tables
# --------------------------------------------------------------
public_route_table_configs = {
  "web-pub-rt" = { vpc_key = "vpc-web", igw_key = "vpc-web", associated_public_subnets = ["web-pub-1a", "web-pub-1b"] }
  "app-pub-rt" = { vpc_key = "vpc-app", igw_key = "vpc-app", associated_public_subnets = ["app-pub-1a", "app-pub-1b"] }
  "db-pub-rt"  = { vpc_key = "vpc-db",  igw_key = "vpc-db",  associated_public_subnets = ["db-pub-1a", "db-pub-1b"] }
}

# --------------------------------------------------------------
# 3 Private Route Tables
# --------------------------------------------------------------
private_route_table_configs = {
  "web-priv-rt" = { vpc_key = "vpc-web", nat_gateway_key = "web-nat-1a", associated_private_subnets = ["web-priv-1a", "web-priv-1b"] }
  "app-priv-rt" = { vpc_key = "vpc-app", nat_gateway_key = "app-nat-1a", associated_private_subnets = ["app-priv-1a", "app-priv-1b"] }
  "db-priv-rt"  = { vpc_key = "vpc-db",  nat_gateway_key = "db-nat-1a",  associated_private_subnets = ["db-priv-1a", "db-priv-1b"] }
}