variable "env_name" {
  description = "Environment name"
}

locals {
  function_name               = "text_scrambler"
  function_handler            = "main.handler"
  function_runtime            = "python3.9"
  function_timeout_in_seconds = 5

  function_source_dir = "${path.module}/aws_lambda_functions/${local.function_name}"
}

resource "aws_lambda_function" "function" {
  function_name = "${local.function_name}-${var.env_name}"
  handler       = local.function_handler
  runtime       = local.function_runtime
  timeout       = local.function_timeout_in_seconds

  filename         = "${local.function_source_dir}.zip"
  source_code_hash = data.archive_file.function_zip.output_base64sha256

  role = aws_iam_role.function_role.arn

  environment {
    variables = {
      ENVIRONMENT = var.env_name
    }
  }
}

data "archive_file" "function_zip" {
  source_dir  = local.function_source_dir
  type        = "zip"
  output_path = "${local.function_source_dir}.zip"
}

resource "aws_iam_role" "function_role" {
  name = "${local.function_name}-${var.env_name}"
  
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
