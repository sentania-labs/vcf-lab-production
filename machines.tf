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

#create dns Names
module "machine_dns_names" {
  source  = "sentania-labs/msdns/dns"
  version = "0.1.0"

  for_each  = module.machine
  hostname  = each.value.virtual_machine.name
  zone      = "int.sentania.net."
  addresses = ["${each.value.virtual_machine.ipaddr}"]
}