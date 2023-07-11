# main.tf
data "google_project" "existing_project" {
  project_id = var.project_id
}

# Creates a project in Google Cloud, in a given organisation and billing account
resource "google_project" "project" {
  count               = length(data.google_project.existing_project) > 0 ? 0 : 1
  name                = var.project_name
  project_id          = var.project_id
  org_id              = var.org_id
  auto_create_network = var.auto_create_network
  labels              = var.labels
}

resource "google_project_service" "enable_api" {
  for_each  = toset(var.api_list)
  project   = var.project_id
  service   = each.key
}