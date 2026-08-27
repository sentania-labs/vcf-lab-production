terraform {
  required_version = ">= 1.14.0"
  required_providers {
    vra = {
      source  = "vmware/vra"
      version = ">= 0.15.0"
    }
  }
}
