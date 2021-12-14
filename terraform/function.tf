data "archive_file" "scheleton_zip" {
    type          = "zip"
    source_file   = "./lambda_function.py"
    output_path   = "./scheleton_code.zip"
}


resource "aws_lambda_function" "lambda_1" {
  filename         = "./scheleton_code.zip"
  function_name    = "lambda-1"
  role             = aws_iam_role.lambda_assumerole.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.scheleton_zip.output_base64sha256
  runtime          = "python3.9"

  environment {
    variables = {
      foo = "bar"
    }
  } 

  memory_size = 1024
  timeout = 30

  tags = merge(
    var.tags,
    {
      Name = "lambda-1"
      Type = "lambda"
    }
  )
}

resource "aws_lambda_alias" "lambda_1_lambda_alias_dev" {
  name             = "dev"
  description      = "dev"
  function_name    = aws_lambda_function.lambda_1.arn
  function_version = "$LATEST"
}
