resource "aws_iam_policy" "s3_read_access" {
  name        = "S3ReadAccessPolicy"
  description = "Policy for reading S3 bucket contents"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:*"],
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::${var.environment}-${var.name_s3}-${var.region}.comunidadetilabs.com.br",
          "arn:aws:s3:::${var.environment}-${var.name_s3}-${var.region}.comunidadetilabs.com.br/*",
        ],
      },
    ],
  })
}



resource "aws_iam_role" "ec2_s3_read_role" {
  name = "EC2S3ReadWriteRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Principal = {"Service": "ec2.amazonaws.com"},
        Effect    = "Allow",
        Sid       = "",
      },
    ],
  })
  depends_on = [ aws_iam_policy.s3_read_access ]
}

resource "aws_iam_role_policy_attachment" "s3_read_access_attachment" {
  role       = aws_iam_role.ec2_s3_read_role.name
  policy_arn = aws_iam_policy.s3_read_access.arn
  depends_on = [ aws_iam_role.ec2_s3_read_role ]
}