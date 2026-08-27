provider "vra" {
  url           = var.vcfa_url
  organization  = var.vcfa_organization
  refresh_token = var.vcfa_refresh_token
  insecure      = var.insecure
}
provider "dns" {
  update {
    server = var.dns_server
    gssapi {
      realm    = var.krb_realm
      username = var.serviceAccountUserName
      password = var.serviceAccountPassword
    }
  }
}
