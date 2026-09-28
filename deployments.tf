module "deployments" {
  source   = "sentania-labs/deployment/vra"
  version  = "0.3.0"
  for_each = var.deployments

  project_name    = var.project_name
  deployment_name = each.value.deployment_name
  description     = each.value.description
  inputs          = each.value.inputs

  # Blueprint path
  blueprint_name    = try(each.value.blueprint_name, null)
  blueprint_version = try(each.value.blueprint_version, null)

  # Catalog item path
  catalog_item_name    = try(each.value.catalog_item_name, null)
  catalog_item_version = try(each.value.catalog_item_version, null)
}

data "vra_machine" "all" {
  for_each = {
    for k, m in module.deployments :
    k => m.deployment_info
  }

  filter = "deploymentId eq '${each.value.id}'"
}

resource "local_file" "lb_config" {
  content = templatefile("${path.module}/output-template.tpl", {
    nodes = data.vra_machine.all
  })
  filename = "${path.module}/server-list.txt"
}
