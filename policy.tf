resource "aws_iam_policy" "policy" {
  name        = "idr_policy"
  path        = "/"
  description = "IDRInsight test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:sqs:*:674565636223:idr_sqs_queue"
      },
    ]
  })
}

