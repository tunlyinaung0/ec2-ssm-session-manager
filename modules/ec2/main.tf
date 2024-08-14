resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_a
    vpc_security_group_ids = [var.default_sg]
    iam_instance_profile = "SSM-for-ec2"

    tags = {
        Name = "${var.prefix}-ec2"
    }
}

