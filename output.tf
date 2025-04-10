output "cluster_id" {
    value = aws_eks_cluster.project_0.id
    description = "The ID of the EKS cluster"
}

output "node_group_id" {
    value = aws_eks_node_group.project_0.id
    description = "The ID of the EKS node group"
}

output "vpc_id" {
    value = aws_vpc.project_0_vpc.id
    description = "The ID of the VPC"
}

output "subnet_ids" {
    value = aws_subnet.project_0_subnet[*].id
    description = "The IDs of the subnets"
}