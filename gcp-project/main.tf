# main.tf

# Creates a project in Google Cloud, in a given organisation and billing account
resource "google_project" "project" {
  name                = var.project_name
  project_id          = var.project_id
  org_id              = var.org_id
  billing_account_id  = var.billing_account_id
  auto_create_network = var.auto_create_network
  labels              = var.labels
}

resource "google_project_service" "enable_api" {
  for_each  = toset(var.api_list)
  project   = var.project_id
  service   = each.key
}

