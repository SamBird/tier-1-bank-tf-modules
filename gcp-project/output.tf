output "project_id" {
  value = google_project.project.project_id
}

output "project_name" {
  value = google_project.project.name
}

output "enabled_apis" {
  value = [for api in var.api_list : google_project_service.enable_api[api].service]
}