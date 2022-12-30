variable "env_name" {
  description = "Environment name"
}

data "aws_ecr_repository" "profile_faker_ecr_repo" {
  name = "profile-faker"
}

resource "aws_lambda_function" "profile_faker_function" {
  function_name = "profile-faker-${var.env_name}"
  timeout       = 5 # seconds
  image_uri     = "${data.aws_ecr_repository.profile_faker_ecr_repo.repository_url}:${var.env_name}"
  package_type  = "Image"

  role = aws_iam_role.profile_faker_function_role.arn

  environment {
    variables = {
      ENVIRONMENT = var.env_name
    }
  }
}

resource "aws_iam_role" "profile_faker_function_role" {
  name = "profile-faker-${var.env_name}"

  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
