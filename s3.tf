module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "${var.environment}-${var.name_s3}-${var.region}.comunidadetilabs.com.br"
  acl    = "private"
  force_destroy = true
  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  tags = merge(var.globaltags)
}
