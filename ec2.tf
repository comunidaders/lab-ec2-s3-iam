resource "aws_iam_instance_profile" "ec2_s3_read_profile" {
  name = "ec2-s3-read-profile"
  role = aws_iam_role.ec2_s3_read_role.name
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = var.name
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  monitoring             = true
  vpc_security_group_ids = ["sg-074f97b78c8a25f32"]
  subnet_id              = "subnet-0d7ee63df18876607"
  iam_instance_profile   = aws_iam_instance_profile.ec2_s3_read_profile.name
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  depends_on = [ aws_iam_instance_profile.ec2_s3_read_profile ]
}


