# Package Lambda code into a ZIP file
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "./files/${var.lambda_file_name}.mjs"
  output_path = "./files/${var.lambda_file_name}.zip"
}

# Create AWS Lambda function
resource "aws_lambda_function" "own_lambda" {
  function_name    = var.lambda_function_name
  handler          = "index.handler"           # Node.js handler
  runtime          = "nodejs20.x"              # Supported Lambda runtime
  role             = aws_iam_role.iam_for_lambda.arn
  filename         = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256

  depends_on = [
    aws_iam_role.iam_for_lambda
  ]
}
