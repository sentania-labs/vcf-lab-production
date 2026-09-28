# The request. Its twin (hr-vm1-tf) is built by sentania-labs/tf-private-cloud
# straight against vCenter; here VCF Automation decides where it lands.
virtual_machines = {
  hr_vm_1 = {
    zone                        = "int.sentania.net"
    virtual_machine_name        = "hr-vm1-vcfa"
    virtual_machine_description = "Deployed via TF - Do not Edit"
    image                       = "ubuntu24"
    flavor                      = "medium"
    tags = [
      { key = "serviceLevel", value = "production" },
      { key = "application", value = "hr" }
    ]
    # Placement intent, not placement: "a production pool", matched against
    # the serviceLevel tag the platform team put on compute.
    constraints = [
      {
        mandatory  = true
        expression = "serviceLevel:production"
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

deployments = {}
