module "frontend" {
  depends_on = [module.backend]
  source     = "git::https://github.com/raghudevopsb79/tf-module-app.git"

  instance_type = var.components["frontend"]["instance_type"]
  name          = var.components["frontend"]["name"]
  env           = var.env
  port_no       = var.components["frontend"]["port_no"]
  vault_token   = var.vault_token
}

module "backend" {
  depends_on = [module.mysql]
  source     = "git::https://github.com/raghudevopsb79/tf-module-app.git"

  instance_type = var.components["backend"]["instance_type"]
  name          = var.components["backend"]["name"]
  env           = var.env
  port_no       = var.components["backend"]["port_no"]
  vault_token   = var.vault_token

}

module "mysql" {
  source = "git::https://github.com/raghudevopsb79/tf-module-app.git"

  instance_type = var.components["mysql"]["instance_type"]
  name          = var.components["mysql"]["name"]
  env           = var.env
  port_no       = var.components["mysql"]["port_no"]
  vault_token   = var.vault_token

}
