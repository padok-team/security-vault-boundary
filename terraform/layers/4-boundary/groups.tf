##############
### GROUPS ###
##############

resource "boundary_group" "admin" {
  name        = "Admin"
  description = "Group for padoxx admin"
  member_ids  = [boundary_user.josephines.id]
  scope_id    = boundary_scope.org.id
}

resource "boundary_group" "dba" {
  name        = "dba"
  description = "Group for padoxx dba"
  member_ids  = [boundary_user.thibaultl.id]
  scope_id    = boundary_scope.org.id
}

resource "boundary_group" "dev" {
  name        = "Dev"
  description = "Group for padoxx dev"
  member_ids  = [boundary_user.clementf.id]
  scope_id    = boundary_scope.org.id
}