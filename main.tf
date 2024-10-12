provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "assessment" {
  name     = "assessment2"
  role_arn = "IAM role for cluster"

  vpc_config {
    subnet_ids = "Check the infra"
  }
}

resource "aws_iam_role" "eks_cluster" {
  name        = "aws_eks_custom"
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

resource "aws_eks_node_group" "nodegroup_eks" {
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
