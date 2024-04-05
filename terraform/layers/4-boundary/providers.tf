provider "boundary" {
  addr             = "http://boundary-api.padok.school"
  recovery_kms_hcl = <<EOT
kms "awskms" {
  purpose    = "recovery"
  region = "eu-west-3"
  kms_key_id = "${data.terraform_remote_state.backbone.outputs.kms_id}"
}
EOT
}

