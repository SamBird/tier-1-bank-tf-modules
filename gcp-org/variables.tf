# Define the module inputs
variable "org_id" {
  description = "The ID of the GCP organization"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account for the organization"
  type        = string
}

variable "org_owners" {
  description = "List of email addresses for organization owners"
  type        = list(string)
}

variable "org_members" {
  description = "List of email addresses for organization members"
  type        = list(string)
}