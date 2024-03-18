resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "eks_subnet" {
  count             = length(var.subnet_cidr_block)
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = var.subnet_cidr_block[count.index]
}

module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "movie-cluster"
  cluster_version = "1.29"
  subnets         = aws_subnet.eks_subnet[*].id
  vpc_id          = aws_vpc.eks_vpc.id
  instance_type   = var.instance_type
  node_group_name = "movies-node-group"

}