data "terraform_remote_state" "backbone" {
  backend = "s3"

  config = {
    bucket  = "poc-vcb-lib-terraform-state"
    key     = "backbone/tfstate.json"
    region  = "eu-west-3"
    profile = "padok_school"
  }
}

data "terraform_remote_state" "vault" {
  backend = "s3"

  config = {
    bucket  = "poc-vcb-lib-terraform-state"
    key     = "vault/tfstate.json"
    region  = "eu-west-3"
    profile = "padok_school"
  }
}
