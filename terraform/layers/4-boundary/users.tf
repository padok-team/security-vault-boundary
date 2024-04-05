#############
### USERS ###
#############

resource "boundary_account_password" "thibaultl" {
  auth_method_id = boundary_auth_method.password.id
  login_name     = "thibaultl"
  password       = ""
}

resource "boundary_user" "thibaultl" {
  scope_id    = boundary_scope.org.id
  account_ids = [boundary_account_password.thibaultl.id]
  name        = "Thibault"
  description = "Thibault's user resource"
}

resource "boundary_account_password" "clementf" {
  auth_method_id = boundary_auth_method.password.id
  login_name     = "clementf"
  password       = "xxxxxx"
}

resource "boundary_user" "clementf" {
  scope_id    = boundary_scope.org.id
  account_ids = [boundary_account_password.clementf.id]
  name        = "Clément"
  description = "Clément's user resource"
}

resource "boundary_account_password" "josephines" {
  auth_method_id = boundary_auth_method.password.id
  login_name     = "josephines"
  password       = "xxxxxx"
}

resource "boundary_user" "josephines" {
  scope_id    = boundary_scope.org.id
  account_ids = [boundary_account_password.josephines.id]
  name        = "Joséphine"
  description = "Joséphine's user resource"
}