module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnets" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr_block
}

module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "movie-cluster"
  cluster_version = "1.29"
  subnets         = aws_subnet.subnets[*].id
  vpc_id          = module.vpc.vpc_id
  instance_type   = var.instance_type
  node_group_name = "movies-node-group"

}