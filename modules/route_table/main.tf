resource "aws_route_table" "private_rtb" {
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.prefix}-private-rtb"
    }
}

resource "aws_route_table_association" "private_rtb_association_a" {
    subnet_id = var.subnet_a
    route_table_id = aws_route_table.private_rtb.id
}

resource "aws_route_table_association" "private_rtb_association_b" {
    subnet_id = var.subnet_b
    route_table_id = aws_route_table.private_rtb.id
}