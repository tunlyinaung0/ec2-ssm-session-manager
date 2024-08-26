resource "aws_route_table" "private_rtb_a" {
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.prefix}-private-rtb-a"
    }
}

resource "aws_route_table" "private_rtb_b" {
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.prefix}-private-rtb-b"
    }
}
resource "aws_route_table_association" "private_rtb_association_a" {
    subnet_id = var.subnet_a
    route_table_id = aws_route_table.private_rtb_a.id
}

resource "aws_route_table_association" "private_rtb_association_b" {
    subnet_id = var.subnet_b
    route_table_id = aws_route_table.private_rtb_b.id
}