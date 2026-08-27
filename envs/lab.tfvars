virtual_machines = {
  hr_vm_1a = {
    zone                        = "int.sentania.net"
    virtual_machine_name        = "hr-vm1a"
    virtual_machine_description = "Deployed via TF - Do not Edit"
    image                       = "ubuntu24"
    flavor                      = "medium"
    tags = [
      { key = "serviceLevel", value = "production" },
      { key = "application", value = "hr" }
    ]
    constraints = [
      {
        mandatory  = true
        expression = "application:hr"
      }
    ]
    image_disk_constraints = [
      {
        mandatory  = true
        expression = "storageTier:iscsi"
      }
    ]
  },
  hr_vm_2a = {
    zone                        = "int.sentania.net"
    virtual_machine_name        = "hr-vm2a"
    virtual_machine_description = "Deployed via TF - Do not Edit"
    image                       = "ubuntu24"
    flavor                      = "medium"
    tags = [
      { key = "serviceLevel", value = "production" },
      { key = "application", value = "hr" }
    ]
    constraints = [
      {
        mandatory  = true
        expression = "application:hr"
      }
    ]
    image_disk_constraints = [
      {
        mandatory  = true
        expression = "storageTier:iscsi"
      }
    ]
  }
}
deployments = {
  catalogdeployment1 = {
    catalog_item_name    = "VM With Disks"
    deployment_name      = "Simple No Frills Version - 1a"
    description          = "Provisioned by TF"
    catalog_item_version = 2
    inputs = {
      flavorSize = "medium"
      diskCount  = 2
      diskSize   = 10
      image      = "ubuntu22"
    }
  }
  catalogdeployment2 = {
    catalog_item_name    = "VM With Disks"
    deployment_name      = "Simple No Frills Version - 2a"
    description          = "Provisioned by TF"
    catalog_item_version = 2
    inputs = {
      flavorSize = "medium"
      diskCount  = 2
      diskSize   = 10
      image      = "ubuntu22"
    }
  }
  catalogdeployment3 = {
    catalog_item_name    = "VM With Disks"
    deployment_name      = "Ubuntu Deployment with Tags Array"
    description          = "Provisioned by TF"
    catalog_item_version = 3
    inputs = {
      flavorSize = "medium"
      diskCount  = 2
      diskSize   = 10
      image      = "ubuntu22"
      tags = [
        { key = "serviceLevel", value = "production" },
        { key = "application", value = "finance" }
      ]
    }
  }
  blueprintdeployment1 = {
    blueprint_name    = "VM With Disks"
    deployment_name   = "Ubuntu Deployment with   required tags"
    description       = "Provisioned by TF"
    blueprint_version = "explicittags"
    inputs = {
      flavorSize   = "medium"
      diskCount    = 2
      diskSize     = 10
      image        = "ubuntu24"
      serviceLevel = "sandbox"
      application  = "sandbox"
    }
  }
}
