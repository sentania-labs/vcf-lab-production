#Catalog IaC vms
module "machine" {
  source   = "sentania-labs/machine/vra"
  version  = "0.2.0"
  for_each = var.virtual_machines

  virtual_machine_name        = each.value.virtual_machine_name
  virtual_machine_description = each.value.virtual_machine_description
  project_name                = var.project_name
  image                       = each.value.image
  flavor                      = each.value.flavor
  constraints                 = each.value.constraints
  image_disk_constraints      = each.value.image_disk_constraints
  tags                        = each.value.tags
}
