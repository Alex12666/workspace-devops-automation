resource "aws_ecr_repository" "foo" {
  name                 = "my-imagem"
  image_tag_mutability = "MUTABLE"


}