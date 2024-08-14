terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}


resource "aws_vpc" "lab_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = "${var.prefix}-vpc"
    }
}

module "subnets" {
    source = "./modules/subnets"

    vpc_id = aws_vpc.lab_vpc.id
    subnet_cidr_a = var.subnet_cidr_a
    subnet_cidr_b = var.subnet_cidr_b
    prefix = var.prefix
  
}

module "route_table" {
    source = "./modules/route_table"

    vpc_id = aws_vpc.lab_vpc.id
    subnet_a = module.subnets.subnet_a
    subnet_b = module.subnets.subnet_b
    prefix = var.prefix
}

module "security_groups" {
    source = "./modules/security_groups"

    vpc_id = aws_vpc.lab_vpc.id
    prefix = var.prefix
}

module "vpc_endpoint" {
    source = "./modules/vpc_endpoint"

    vpc_id = aws_vpc.lab_vpc.id
    ssm_sg = module.security_groups.ssm_sg
    subnet_b = module.subnets.subnet_b
    prefix = var.prefix
}

module "ec2" {
    source = "./modules/ec2"

    ami = var.ami
    instance_type = var.instance_type
    subnet_a = module.subnets.subnet_a
    default_sg = module.security_groups.default_sg
    prefix = var.prefix
}