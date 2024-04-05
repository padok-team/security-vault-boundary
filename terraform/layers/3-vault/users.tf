resource "vault_generic_endpoint" "josephines" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/josephines"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["admin"],
  "password": "xxxxxx"
}
EOT
}

resource "vault_generic_endpoint" "thibaultl" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/thibaultl"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["database_ops"],
  "password": "xxxxxx"
}
EOT
}

resource "vault_generic_endpoint" "clementf" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/clementf"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["database_dev"],
  "password": "xxxxxx"
}
EOT
}