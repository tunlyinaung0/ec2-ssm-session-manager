resource "aws_subnet" "private_subnet_a" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr_a
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.prefix}-private-subnet-a"
    }
}

resource "aws_subnet" "private_subnet_b" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr_b
    availability_zone = "us-east-1b"

    tags = {
        Name = "${var.prefix}-private-subnet-b"
    }
}

