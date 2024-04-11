locals {
  roles = ["dev", "ops"]
}

resource "vault_mount" "db" {
  path = "postgres"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend       = vault_mount.db.path
  name          = "postgres"
  allowed_roles = local.roles
  plugin_name   = "postgresql-database-plugin"

  postgresql {
    connection_url = "postgresql://vault:vault-password@${data.terraform_remote_state.backbone.outputs.rds.this.address}:5432/postgres"
    username       = "vault"
    password       = "vault-password"
  }
}

resource "vault_database_secret_backend_role" "these" {
  for_each              = toset(local.roles)
  backend               = vault_mount.db.path
  name                  = each.key
  db_name               = vault_database_secret_backend_connection.postgres.name
  creation_statements   = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}' inherit; grant ${each.key} to \"{{name}}\";"]
  revocation_statements = ["DROP ROLE \"{{name}}\";"]
  default_ttl           = "86400"
}
