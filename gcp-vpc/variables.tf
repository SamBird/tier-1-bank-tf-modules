# Variables
variable "vpc_name" {
  description = "Name for the VPC network"
  type        = string
}

variable "description" {
  description = "Description for the VPC network"
  type        = string
}

variable "host_project_id" {
  description = "Project ID for GCP"
  type        = string
}

variable "service_projects" {
  description = "Map of service projects with subnet configurations"
  type  = map(object({
    project_num   = string
    subnet_name   = string
    subnet_cidr   = string
    subnet_region = string
  }))
}