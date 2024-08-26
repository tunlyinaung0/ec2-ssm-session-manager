resource "aws_default_security_group" "default" {
    vpc_id = var.vpc_id


    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.prefix}-default-sg"
    }
}

resource "aws_security_group" "ssm_sg" {
    vpc_id = var.vpc_id

    # ingress {
    #     from_port = 443
    #     to_port = 443
    #     protocol = "tcp"
    #     security_groups = [aws_default_security_group.default.id]
    # }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.prefix}-ssm-sg"
    }
  
}