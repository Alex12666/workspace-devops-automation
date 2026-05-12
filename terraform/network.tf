
data "aws_subnets" "lista_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc]
  }
}


data "aws_subnet" "existsubnet" {
  id = data.aws_subnets.lista_subnets.ids[0]
}


resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket-alexandre-devops-2026"
  tags = {
    Name = "My bucket"
  }
}