# ==============================================================
# Global Configuration
# ==============================================================
project_name = "myproject"
environment  = "dev"
owner        = "aws-devops-team"

# ==============================================================
# Network Configurations
# (Define your actual IP ranges, AZs, and settings here)
# ==============================================================
vpc_configs                 = {}
public_subnet_configs       = {}
private_subnet_configs      = {}
public_route_table_configs  = {}
private_route_table_configs = {}
nat_gateway_configs         = {}

# ==============================================================
# Resource Dependency Maps
# (Used for passing existing resource IDs if not created in this run)
# ==============================================================
vpc_ids            = {}
igw_ids            = {}
public_subnet_ids  = {}
private_subnet_ids = {}
nat_gateway_ids    = {}