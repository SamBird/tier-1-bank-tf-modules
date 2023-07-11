# variables.tf
variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "role" {
  description = "The IAM role to assign"
  type        = string
}

variable "member" {
  description = "The member to add to the IAM role"
  type        = string
}