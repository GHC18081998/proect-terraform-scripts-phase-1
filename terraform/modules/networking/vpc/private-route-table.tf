# ==============================================================
# Private Route Table Module
# Creates route tables with NAT Gateway routes
# Automatically associates with private subnets
# ==============================================================

# Private Route Tables
resource "aws_route_table" "private" {
  for_each = var.private_route_table_configs

  vpc_id = aws_vpc.this[each.value.vpc_key].id

  # Default route to NAT Gateway
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this[each.value.nat_gateway_key].id
  }

  tags = merge(local.common_tags, each.value.tags, {
    Name          = "${var.project_name}-${var.environment}-${each.key}-private-rt"
    VPCKey        = each.value.vpc_key
    NATGatewayKey = each.value.nat_gateway_key
    Type          = "private"
  })
}

# Route Table Associations - Private Subnets
resource "aws_route_table_association" "private" {
  for_each = local.private_rt_subnet_associations

  subnet_id      = aws_subnet.private[each.value.subnet_key].id
  route_table_id = aws_route_table.private[each.value.route_table_key].id
}
