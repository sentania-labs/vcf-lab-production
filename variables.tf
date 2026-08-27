variable "vcfa_url" {
  type    = string
  default = "https://api.mgmt.cloud.vmware.com"
}

variable "vcfa_refresh_token" {
  type      = string
  sensitive = true
}

variable "vcfa_organization" {
  type = string
}

variable "insecure" {
  type    = bool
  default = true
}
variable "project_name" {
  type        = string
  description = "The name of the project to deploy to"
}
########################################
# Deployment Requests
########################################

/**
 * deployments
 *
 * A map of deployment request definitions. Each key represents a logical
 * deployment name, and the associated value defines how that deployment
 * should be created within Aria Automation (VCF-A).
 *
 * Structure:
 *
 * deployments = {
 *   key = {
 *     catalog_item_name = string
 *     catalog_item_version = string
 *     deployment_name   = string
 *     description       = string
 *
 *     // Freeform blueprint inputs:
 *     //   These are passed directly to the vRA deployment and must match
 *     //   the blueprint's expected input schema. The module does *not*
 *     //   enforce specific fields, allowing each blueprint to define its
 *     //   own input requirements.
 *     inputs = {
 *       <string-key> = any
 *     }
 *   }
 * }
 *
 * Notes:
 *   - `inputs` is typed as map(any) to allow arbitrary key/value pairs.
 *   - Different deployments can define completely different input maps.
 *   - The module should simply forward these inputs to vRA via inputs_json.
 */
variable "deployments" {
  description = "Map of vRA deployment request definitions."
  type        = any
}

variable "virtual_machines" {
  description = "Map of virtual machines to deploy."
  type        = any
}

variable "dns_server" {
  type        = string
  description = "DNS server to publish records to"
}

variable "krb_realm" {
  type        = string
  description = "Kerberos Realm to authenticate against"
}

variable "serviceAccountUserName" {
  type        = string
  description = "KRB username"
}

variable "serviceAccountPassword" {
  type        = string
  sensitive   = true
  description = "Password"
}
