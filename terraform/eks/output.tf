output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks_cluster.cluster_endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks_cluster.cluster_name
}

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.eks_subnet[*].id
}
