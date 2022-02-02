resource "aws_ecr_repository" "docker-ecr-ap-training-image" {
  name = "docker-ecr-ap-training-image"
  tags = merge(
    local.common_tags,
    { DockerHub : "dwpdigital/docker-ecr-ap-training-image" }
  )
}

resource "aws_ecr_repository_policy" "docker-ecr-ap-training-image" {
  repository = aws_ecr_repository.docker-ecr-ap-training-image.name
  policy     = data.terraform_remote_state.management.outputs.ecr_iam_policy_document
}

output "ecr_example_url" {
  value = aws_ecr_repository.docker-ecr-ap-training-image.repository_url
}
