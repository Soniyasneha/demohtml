module "bucket1" {
  source      = "./modules/webserver"
  bucket_name = var.bucket1_bucket_name
}

module "bucket2" {
  source      = "./modules/webserver"
  bucket_name = var.bucket2_bucket_name
}
