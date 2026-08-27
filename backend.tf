terraform {
  backend "s3" {
    bucket       = "sentania-labs-terraform-state"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}