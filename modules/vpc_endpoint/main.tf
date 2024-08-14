resource "aws_vpc_endpoint" "ssm" {
    vpc_id = var.vpc_id
    service_name = "com.amazonaws.us-east-1.ssm"
    vpc_endpoint_type = "Interface"

    security_group_ids = [var.ssm_sg]
    subnet_ids = [var.subnet_b]

    tags = {
        Name = "${var.prefix}-ssm-vpc-endpoint"
    }
}

resource "aws_vpc_endpoint" "ssmmessages" {
    vpc_id = var.vpc_id
    service_name = "com.amazonaws.us-east-1.ssmmessages"
    vpc_endpoint_type = "Interface"

    security_group_ids = [var.ssm_sg]
    subnet_ids = [var.subnet_b] 

    tags = {
        Name = "${var.prefix}-ssmmessages-vpc-endpoint"
    }
}

resource "aws_vpc_endpoint" "ec2messages" {
    vpc_id = var.vpc_id
    service_name = "com.amazonaws.us-east-1.ec2messages"
    vpc_endpoint_type = "Interface"

    security_group_ids = [var.ssm_sg]
    subnet_ids = [var.subnet_b]

    tags = {
        Name = "${var.prefix}-ec2messages-vpc-endpoint"
    }  
}