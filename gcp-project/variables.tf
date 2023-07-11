# variables.tf

variable "project_id" {
  description = "The desired ID for the GCP project."
  type        = string
}

variable "project_name" {
  description = "The desired name for the GCP project."
  type        = string
}

variable "org_id" {
  description = "The ID of the GCP organisation to create the project in."
  type        = string
}

variable "auto_create_network" {
  description = "Boolean to auto create VPC network for project"
  type        = bool
}

variable "labels" {
  description = "A map of labels to assign to the project."
  type        = map(string)
}

variable "api_list" {
  description = "A list of Google APIs to enable for the project."
  type        = list(string)
}

