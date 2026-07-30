# ==============================================================
# PROD Environment Configuration - Multi-VPC (All 6 us-east-1 AZs)
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
# 18 Public Subnets (6 AZs x 3 VPCs)
# --------------------------------------------------------------
public_subnet_configs = {
  # Web VPC Public Subnets
  "web-pub-1a" = { vpc_key = "vpc-web", cidr_block = "10.10.1.0/24", availability_zone = "us-east-1a", map_public_ip = true }
  "web-pub-1b" = { vpc_key = "vpc-web", cidr_block = "10.10.2.0/24", availability_zone = "us-east-1b", map_public_ip = true }
  "web-pub-1c" = { vpc_key = "vpc-web", cidr_block = "10.10.3.0/24", availability_zone = "us-east-1c", map_public_ip = true }
  "web-pub-1d" = { vpc_key = "vpc-web", cidr_block = "10.10.4.0/24", availability_zone = "us-east-1d", map_public_ip = true }
  "web-pub-1e" = { vpc_key = "vpc-web", cidr_block = "10.10.5.0/24", availability_zone = "us-east-1e", map_public_ip = true }
  "web-pub-1f" = { vpc_key = "vpc-web", cidr_block = "10.10.6.0/24", availability_zone = "us-east-1f", map_public_ip = true }

  # App VPC Public Subnets
  "app-pub-1a" = { vpc_key = "vpc-app", cidr_block = "10.11.1.0/24", availability_zone = "us-east-1a", map_public_ip = true }
  "app-pub-1b" = { vpc_key = "vpc-app", cidr_block = "10.11.2.0/24", availability_zone = "us-east-1b", map_public_ip = true }
  "app-pub-1c" = { vpc_key = "vpc-app", cidr_block = "10.11.3.0/24", availability_zone = "us-east-1c", map_public_ip = true }
  "app-pub-1d" = { vpc_key = "vpc-app", cidr_block = "10.11.4.0/24", availability_zone = "us-east-1d", map_public_ip = true }
  "app-pub-1e" = { vpc_key = "vpc-app", cidr_block = "10.11.5.0/24", availability_zone = "us-east-1e", map_public_ip = true }
  "app-pub-1f" = { vpc_key = "vpc-app", cidr_block = "10.11.6.0/24", availability_zone = "us-east-1f", map_public_ip = true }

  # DB VPC Public Subnets
  "db-pub-1a"  = { vpc_key = "vpc-db",  cidr_block = "10.12.1.0/24", availability_zone = "us-east-1a", map_public_ip = true }
  "db-pub-1b"  = { vpc_key = "vpc-db",  cidr_block = "10.12.2.0/24", availability_zone = "us-east-1b", map_public_ip = true }
  "db-pub-1c"  = { vpc_key = "vpc-db",  cidr_block = "10.12.3.0/24", availability_zone = "us-east-1c", map_public_ip = true }
  "db-pub-1d"  = { vpc_key = "vpc-db",  cidr_block = "10.12.4.0/24", availability_zone = "us-east-1d", map_public_ip = true }
  "db-pub-1e"  = { vpc_key = "vpc-db",  cidr_block = "10.12.5.0/24", availability_zone = "us-east-1e", map_public_ip = true }
  "db-pub-1f"  = { vpc_key = "vpc-db",  cidr_block = "10.12.6.0/24", availability_zone = "us-east-1f", map_public_ip = true }
}

# --------------------------------------------------------------
# 18 Private Subnets (6 AZs x 3 VPCs)
# --------------------------------------------------------------
private_subnet_configs = {
  # Web VPC Private Subnets
  "web-priv-1a" = { vpc_key = "vpc-web", cidr_block = "10.10.10.0/24", availability_zone = "us-east-1a", subnet_type = "app" }
  "web-priv-1b" = { vpc_key = "vpc-web", cidr_block = "10.10.11.0/24", availability_zone = "us-east-1b", subnet_type = "app" }
  "web-priv-1c" = { vpc_key = "vpc-web", cidr_block = "10.10.12.0/24", availability_zone = "us-east-1c", subnet_type = "app" }
  "web-priv-1d" = { vpc_key = "vpc-web", cidr_block = "10.10.13.0/24", availability_zone = "us-east-1d", subnet_type = "app" }
  "web-priv-1e" = { vpc_key = "vpc-web", cidr_block = "10.10.14.0/24", availability_zone = "us-east-1e", subnet_type = "app" }
  "web-priv-1f" = { vpc_key = "vpc-web", cidr_block = "10.10.15.0/24", availability_zone = "us-east-1f", subnet_type = "app" }

  # App VPC Private Subnets
  "app-priv-1a" = { vpc_key = "vpc-app", cidr_block = "10.11.10.0/24", availability_zone = "us-east-1a", subnet_type = "app" }
  "app-priv-1b" = { vpc_key = "vpc-app", cidr_block = "10.11.11.0/24", availability_zone = "us-east-1b", subnet_type = "app" }
  "app-priv-1c" = { vpc_key = "vpc-app", cidr_block = "10.11.12.0/24", availability_zone = "us-east-1c", subnet_type = "app" }
  "app-priv-1d" = { vpc_key = "vpc-app", cidr_block = "10.11.13.0/24", availability_zone = "us-east-1d", subnet_type = "app" }
  "app-priv-1e" = { vpc_key = "vpc-app", cidr_block = "10.11.14.0/24", availability_zone = "us-east-1e", subnet_type = "app" }
  "app-priv-1f" = { vpc_key = "vpc-app", cidr_block = "10.11.15.0/24", availability_zone = "us-east-1f", subnet_type = "app" }

  # DB VPC Private Subnets
  "db-priv-1a"  = { vpc_key = "vpc-db",  cidr_block = "10.12.10.0/24", availability_zone = "us-east-1a", subnet_type = "data" }
  "db-priv-1b"  = { vpc_key = "vpc-db",  cidr_block = "10.12.11.0/24", availability_zone = "us-east-1b", subnet_type = "data" }
  "db-priv-1c"  = { vpc_key = "vpc-db",  cidr_block = "10.12.12.0/24", availability_zone = "us-east-1c", subnet_type = "data" }
  "db-priv-1d"  = { vpc_key = "vpc-db",  cidr_block = "10.12.13.0/24", availability_zone = "us-east-1d", subnet_type = "data" }
  "db-priv-1e"  = { vpc_key = "vpc-db",  cidr_block = "10.12.14.0/24", availability_zone = "us-east-1e", subnet_type = "data" }
  "db-priv-1f"  = { vpc_key = "vpc-db",  cidr_block = "10.12.15.0/24", availability_zone = "us-east-1f", subnet_type = "data" }
}

# --------------------------------------------------------------
# 18 NAT Gateways (1 per AZ per VPC)
# --------------------------------------------------------------
nat_gateway_configs = {
  "web-nat-1a" = { public_subnet_key = "web-pub-1a" }
  "web-nat-1b" = { public_subnet_key = "web-pub-1b" }
  "web-nat-1c" = { public_subnet_key = "web-pub-1c" }
  "web-nat-1d" = { public_subnet_key = "web-pub-1d" }
  "web-nat-1e" = { public_subnet_key = "web-pub-1e" }
  "web-nat-1f" = { public_subnet_key = "web-pub-1f" }

  "app-nat-1a" = { public_subnet_key = "app-pub-1a" }
  "app-nat-1b" = { public_subnet_key = "app-pub-1b" }
  "app-nat-1c" = { public_subnet_key = "app-pub-1c" }
  "app-nat-1d" = { public_subnet_key = "app-pub-1d" }
  "app-nat-1e" = { public_subnet_key = "app-pub-1e" }
  "app-nat-1f" = { public_subnet_key = "app-pub-1f" }

  "db-nat-1a"  = { public_subnet_key = "db-pub-1a" }
  "db-nat-1b"  = { public_subnet_key = "db-pub-1b" }
  "db-nat-1c"  = { public_subnet_key = "db-pub-1c" }
  "db-nat-1d"  = { public_subnet_key = "db-pub-1d" }
  "db-nat-1e"  = { public_subnet_key = "db-pub-1e" }
  "db-nat-1f"  = { public_subnet_key = "db-pub-1f" }
}

# --------------------------------------------------------------
# 3 Public Route Tables
# --------------------------------------------------------------
public_route_table_configs = {
  "web-pub-rt" = { vpc_key = "vpc-web", igw_key = "vpc-web", associated_public_subnets = ["web-pub-1a", "web-pub-1b", "web-pub-1c", "web-pub-1d", "web-pub-1e", "web-pub-1f"] }
  "app-pub-rt" = { vpc_key = "vpc-app", igw_key = "vpc-app", associated_public_subnets = ["app-pub-1a", "app-pub-1b", "app-pub-1c", "app-pub-1d", "app-pub-1e", "app-pub-1f"] }
  "db-pub-rt"  = { vpc_key = "vpc-db",  igw_key = "vpc-db",  associated_public_subnets = ["db-pub-1a", "db-pub-1b", "db-pub-1c", "db-pub-1d", "db-pub-1e", "db-pub-1f"] }
}

# --------------------------------------------------------------
# 3 Private Route Tables
# --------------------------------------------------------------
private_route_table_configs = {
  "web-priv-rt" = { vpc_key = "vpc-web", nat_gateway_key = "web-nat-1a", associated_private_subnets = ["web-priv-1a", "web-priv-1b", "web-priv-1c", "web-priv-1d", "web-priv-1e", "web-priv-1f"] }
  "app-priv-rt" = { vpc_key = "vpc-app", nat_gateway_key = "app-nat-1a", associated_private_subnets = ["app-priv-1a", "app-priv-1b", "app-priv-1c", "app-priv-1d", "app-priv-1e", "app-priv-1f"] }
  "db-priv-rt"  = { vpc_key = "vpc-db",  nat_gateway_key = "db-nat-1a",  associated_private_subnets = ["db-priv-1a", "db-priv-1b", "db-priv-1c", "db-priv-1d", "db-priv-1e", "db-priv-1f"] }
}
