# ==============================================================
# TEST Environment Configuration - Single VPC Setup
# ==============================================================

aws_region   = "us-east-1"
project_name = "myproject"
environment  = "test"
owner        = "aws-devops-team"

# --------------------------------------------------------------
# 1 VPC (Automatically creates 1 Internet Gateway named "main")
# --------------------------------------------------------------
vpc_configs = {
  "main" = {
    cidr_block           = "10.10.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"
    tags = {
      Purpose = "test-environment"
    }
  }
}

# --------------------------------------------------------------
# 2 Public Subnets
# --------------------------------------------------------------
public_subnet_configs = {
  "main-pub-1a" = {
    vpc_key           = "main"
    cidr_block        = "10.10.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip     = true
    tags = { Tier = "public" }
  }
  "main-pub-1b" = {
    vpc_key           = "main"
    cidr_block        = "10.10.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip     = true
    tags = { Tier = "public" }
  }
}

# --------------------------------------------------------------
# 2 Private Subnets
# --------------------------------------------------------------
private_subnet_configs = {
  "main-priv-app-1a" = {
    vpc_key           = "main"
    cidr_block        = "10.10.10.0/24"
    availability_zone = "us-east-1a"
    subnet_type       = "app"
    tags = { Tier = "private-app" }
  }
  "main-priv-app-1b" = {
    vpc_key           = "main"
    cidr_block        = "10.10.11.0/24"
    availability_zone = "us-east-1b"
    subnet_type       = "app"
    tags = { Tier = "private-app" }
  }
}

# --------------------------------------------------------------
# 2 NAT Gateways (One in each public subnet)
# --------------------------------------------------------------
nat_gateway_configs = {
  "main-1a" = {
    public_subnet_key = "main-pub-1a"
    tags = { Zone = "us-east-1a" }
  }
  "main-1b" = {
    public_subnet_key = "main-pub-1b"
    tags = { Zone = "us-east-1b" }
  }
}

# --------------------------------------------------------------
# 1 Public Route Table (Routes traffic to the IGW)
# --------------------------------------------------------------
public_route_table_configs = {
  "main-pub-rt" = {
    vpc_key                   = "main"
    igw_key                   = "main"
    associated_public_subnets = ["main-pub-1a", "main-pub-1b"]
    tags = { Type = "public" }
  }
}

# --------------------------------------------------------------
# 1 Private Route Table
# --------------------------------------------------------------
private_route_table_configs = {
  "main-priv-rt" = {
    vpc_key                    = "main"
    nat_gateway_key            = "main-1a" # Note: Only one NAT GW can be the default route
    associated_private_subnets = ["main-priv-app-1a", "main-priv-app-1b"]
    tags = { Zone = "shared" }
  }
}
