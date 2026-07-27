# ==============================================================
# DEV Environment - Networking
# ==============================================================
# Location: terraform/networking/environments/dev/main.tf

module "networking" {
  # The source path goes up two levels (from dev -> environments -> networking)
  # and then down into the combined vpc module folder.
  source = "../../modules/vpc"

  # ------------------------------------------------------------
  # Global Configuration
  # ------------------------------------------------------------
  project_name = var.project_name
  environment  = var.environment
  owner        = var.owner

  # ------------------------------------------------------------
  # Network Topology Configurations
  # ------------------------------------------------------------
  vpc_configs                 = var.vpc_configs
  public_subnet_configs       = var.public_subnet_configs
  private_subnet_configs      = var.private_subnet_configs
  public_route_table_configs  = var.public_route_table_configs
  private_route_table_configs = var.private_route_table_configs
  nat_gateway_configs         = var.nat_gateway_configs
}
