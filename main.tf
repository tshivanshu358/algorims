provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "assessment" {
  name     = "assessment2"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = [aws_subnet.example.id]
  }
}

resource "aws_iam_role" "eks_cluster" {
  name        = "example-eks-cluster-role"
  description = "EKS Cluster Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })
}

resource "aws_eks_node_group" "example" {
  cluster_name    = "assessment2"
  node_group_name = "nodegroup_eks"
  node_role_arn   = arn:aws:iam::905418357958:role/node_eks_assess
  subnet_ids      = subnet-0d330a1fa942844fb , subnet-09c2e4d838c46385f

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t2.medium"]
}