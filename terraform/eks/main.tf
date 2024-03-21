resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "eks_subnet" {
  count             = length(var.subnet_cidr_block)
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = var.subnet_cidr_block[count.index]
}

resource "aws_eks_cluster" "movies" {
  name     = "movies-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.eks_subnet[*].id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy,
  ]
}

#Cluster policy
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2020-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_cluster_role.name
}


resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.movies.name
  node_group_name = "movies-db-node-group"
  node_role_arn   = node_group_name_role
  subnet_ids      = [aws_subnet.eks_subnet[*].id]
  instance_types = var.instance_type

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}
