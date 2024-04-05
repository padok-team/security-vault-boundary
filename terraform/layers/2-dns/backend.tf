terraform {
  backend "s3" {
    profile        = "padok_school"
    dynamodb_table = "poc-vcb-lib-terraform-lock"
    bucket         = "poc-vcb-lib-terraform-state"
    key            = "dns/tfstate.json"
    region         = "eu-west-3"
  }
}
