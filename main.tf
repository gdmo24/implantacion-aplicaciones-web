terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_security_group" "demo_terra" {
  name        = "demo_terra"
  description = "Permitir HTTP y SSH"

  tags = {
    Name = "demo_terra"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.demo_terra.id  
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
