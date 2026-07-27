# ==============================================================
# DEV Environment Configuration
# To add more VPCs: add another entry to vpc_configs
# To add 4 VPCs: add 4 entries to vpc_configs
# ==============================================================

aws_region   = "us-east-1"
project_name = "myproject"
environment  = "dev"
owner        = "aws-devops-team"

# ---- VPC Configurations ----
# Add or remove VPCs here - module automatically creates and attaches all
# EXAMPLE: Currently configured with 2 VPCs for DEV
vpc_configs = {
  "main" = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"
    tags = {
      Purpose = "main-application"
    }
  }
  "secondary" = {
    cidr_block           = "10.1.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"
    tags = {
      Purpose = "secondary-services"
    }
  }
}

# ---- Public Subnet Configurations ----
# vpc_key must match a key from vpc_configs above
public_subnet_configs = {
  "main-pub-1a" = {
    vpc_key           = "main"
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip     = true
    tags = {
      Tier = "public"
    }
  }
  "main-pub-1b" = {
    vpc_key           = "main"
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip     = true
    tags = {
      Tier = "public"
    }
  }
  "secondary-pub-1a" = {
    vpc_key           = "secondary"
    cidr_block        = "10.1.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip     = true
    tags = {
      Tier = "public"
    }
  }
}

# ---- Private Subnet Configurations ----
private_subnet_configs = {
  "main-priv-app-1a" = {
    vpc_key           = "main"
    cidr_block        = "10.0.10.0/24"
    availability_zone = "us-east-1a"
    subnet_type       = "app"
    tags = {
      Tier = "private-app"
    }
  }
  "main-priv-app-1b" = {
    vpc_key           = "main"
    cidr_block        = "10.0.11.0/24"
    availability_zone = "us-east-1b"
    subnet_type       = "app"
    tags = {
      Tier = "private-app"
    }
  }
  "main-priv-data-1a" = {
    vpc_key           = "main"
    cidr_block        = "10.0.20.0/24"
    availability_zone = "us-east-1a"
    subnet_type       = "data"
    tags = {
      Tier = "private-data"
    }
  }
  "main-priv-data-1b" = {
    vpc_key           = "main"
    cidr_block        = "10.0.21.0/24"
    availability_zone = "us-east-1b"
    subnet_type       = "data"
    tags = {
      Tier = "private-data"
    }
  }
  "secondary-priv-app-1a" = {
    vpc_key           = "secondary"
    cidr_block        = "10.1.10.0/24"
    availability_zone = "us-east-1a"
    subnet_type       = "app"
    tags = {
      Tier = "private-app"
    }
  }
}

# ---- NAT Gateway Configurations ----
# public_subnet_key must match a key from public_subnet_configs
nat_gateway_configs = {
  "main-1a" = {
    public_subnet_key = "main-pub-1a"
    tags = {
      Zone = "us-east-1a"
    }
  }
  "main-1b" = {
    public_subnet_key = "main-pub-1b"
    tags = {
      Zone = "us-east-1b"
    }
  }
  "secondary-1a" = {
    public_subnet_key = "secondary-pub-1a"
    tags = {
      Zone = "us-east-1a"
    }
  }
}

# ---- Public Route Table Configurations ----
public_route_table_configs = {
  "main-pub-rt" = {
    vpc_key                   = "main"
    igw_key                   = "main"
    associated_public_subnets = ["main-pub-1a", "main-pub-1b"]
    tags = {
      Type = "public"
    }
  }
  "secondary-pub-rt" = {
    vpc_key                   = "secondary"
    igw_key                   = "secondary"
    associated_public_subnets = ["secondary-pub-1a"]
    tags = {
      Type = "public"
    }
  }
}

# ---- Private Route Table Configurations ----
private_route_table_configs = {
  "main-priv-rt-1a" = {
    vpc_key                    = "main"
    nat_gateway_key            = "main-1a"
    associated_private_subnets = ["main-priv-app-1a", "main-priv-data-1a"]
    tags = {
      Zone = "us-east-1a"
    }
  }
  "main-priv-rt-1b" = {
    vpc_key                    = "main"
    nat_gateway_key            = "main-1b"
    associated_private_subnets = ["main-priv-app-1b", "main-priv-data-1b"]
    tags = {
      Zone = "us-east-1b"
    }
  }
  "secondary-priv-rt-1a" = {
    vpc_key                    = "secondary"
    nat_gateway_key            = "secondary-1a"
    associated_private_subnets = ["secondary-priv-app-1a"]
    tags = {
      Zone = "us-east-1a"
    }
  }
}
