variable "gke_cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "gke_node_pool_name" {
  description = "Name of the GKE node pool"
  type        = string
}

variable "gke_node_pool_machine_type" {
  description = "Machine type of the GKE node pool"
  type        = string
}

variable "description" {
  description = "Description of the GKE cluster"
  type        = string
}

variable "min_node_count" {
  description = "Minimum number of nodes in the GKE cluster"
  type        = number
}

variable "max_node_count" {
  description = "Maximum number of nodes in the GKE cluster"
  type        = number
}

variable "http_load_balancing" {
  description = "Enable HTTP load balancing for the GKE cluster"
  type        = bool
}

variable "disk_type" {
  description = "Type of the disk for GKE cluster nodes"
  type        = string
}

variable "disk_size_gb" {
  description = "Size of the disk for GKE cluster nodes in GB"
  type        = number
}

variable "release_channel" {
  description = "Release channel for the GKE cluster"
  type        = string
}

variable "auto_upgrade" {
  description = "Enable automatic upgrades for the GKE cluster"
  type        = bool
}

variable "auto_repair" {
  description = "Enable automatic repairs for the GKE cluster"
  type        = bool
}

variable "network" {
  description = "The VPC network to provision the GKE cluster"
  type        = string
}

variable "subnetwork" {
  description = "The subnet to provision the GKE cluster"
  type        = string
}

variable "subnet_region" {
  description = "The subnet region to provision the GKE cluster"
  type        = string
}
