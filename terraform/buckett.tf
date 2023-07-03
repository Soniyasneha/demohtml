module "bucket1" {
  source      = "./modules"
  bucket_name = var.bucket1_name
}

module "bucket2" {
  source      = "./modules"
  bucket_name = var.bucket2_name
}
