output "eks_cluster_name" {
  value = aws_eks_cluster.movies.name
}

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.eks_subnet[*].id
}
