resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:sqs:*:674565636223:terraform_queue"
      },
    ]
  })
}

