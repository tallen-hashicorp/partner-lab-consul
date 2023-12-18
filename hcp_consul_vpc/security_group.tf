locals {
  ingress_consul_rules = [
    {
      description = "Consul LAN Serf (tcp)"
      port        = 8301
      protocol    = "tcp"
    },
    {
      description = "Consul LAN Serf (udp)"
      port        = 8301
      protocol    = "udp"
    },
  ]

  # If a list of security_group_ids was provided, construct a rule set.
  hcp_consul_security_groups = flatten([
      for _, rule in local.ingress_consul_rules : {
        security_group_id = aws_vpc.peer.id
        description       = rule.description
        port              = rule.port
        protocol          = rule.protocol
      }
    ])
}

resource "aws_security_group" "hcp_consul" {
  name_prefix = "hcp_consul"
  description = "HCP Consul security group"
  vpc_id      = aws_vpc.peer.id
}

# If a list of security_group_ids was provided, set rules on those.
resource "aws_security_group_rule" "allow_lan_consul_gossip" {
  count = length(local.hcp_consul_security_groups)

  description       = local.hcp_consul_security_groups[count.index].description
  protocol          = local.hcp_consul_security_groups[count.index].protocol
  security_group_id = aws_security_group.hcp_consul.id
  cidr_blocks       = [hcp_hvn.partner_hvn.cidr_block]
  from_port         = local.hcp_consul_security_groups[count.index].port
  to_port           = local.hcp_consul_security_groups[count.index].port
  type              = "ingress"
}

# If no security_group_ids were provided, allow egress on the new security_group.
resource "aws_security_group_rule" "allow_all_egress" {
  description       = "Allow egress access to the Internet."
  protocol          = "-1"
  security_group_id = aws_security_group.hcp_consul.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  type              = "egress"
}

