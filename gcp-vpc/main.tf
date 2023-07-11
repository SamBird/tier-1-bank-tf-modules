# main.tf


# Resource: VPC Network
resource "google_compute_network" "vpc_network" {
  project                           = var.host_project_id
  description                       = var.description 
  name                              = var.vpc_name
  auto_create_subnetworks           = false
  routing_mode                      = "GLOBAL"
  delete_default_routes_on_create   = true
}

# Create Shared VPC host project
resource "google_compute_project_default_network_tier" "default" {
  project       = var.host_project_id
  network_tier  = "PREMIUM"
}

resource "google_compute_shared_vpc_host_project" "host_project" {
  project = var.host_project_id
}

# Create subnetworks in the service projects
locals {
  service_project_resources = {
    for project_id, config in var.service_projects : project_id => {
      project_id     = project_id
      project_num    = config.project_num
      subnet_name    = config.subnet_name
      subnet_cidr    = config.subnet_cidr
      subnet_region  = config.subnet_region
    }
  }
}

resource "google_project_service" "enable_service_project" {
  for_each = local.service_project_resources

  project = each.value.project_id
  service = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_compute_shared_vpc_service_project" "service_project" {
  for_each = local.service_project_resources

  service_project       = each.value.project_id
  host_project          = var.host_project_id
}

resource "google_compute_subnetwork" "subnetwork" {
  for_each    = local.service_project_resources
  
  project       = var.host_project_id
  name          = each.value.subnet_name
  region        = each.value.subnet_region
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = each.value.subnet_cidr
}

resource "google_compute_subnetwork_iam_binding" "subnet_iam_binding" {
  for_each    = local.service_project_resources
  
  project      = var.host_project_id
  region       = each.value.subnet_region
  subnetwork   = each.value.subnet_name
  role         = "roles/compute.networkUser"

  members = [
    "serviceAccount:${each.value.project_num}@cloudservices.gserviceaccount.com",
    "serviceAccount:service-${each.value.project_num}@container-engine-robot.iam.gserviceaccount.com"
  ]

}