# Security Group for Public Load Balancer


module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name        = "${local.name}-loadbalancer-sg"
  description = "Security Group with HTTP open for entire Internet (IPv4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = [ "http-80-tcp", "https-443-tcp"]

  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags

# Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
  ingress_with_cidr_blocks = [
   /* {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0,2.2.2.2/32"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "30.30.30.30/32"
    }, */
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Allow Port 81 from internet"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

}
