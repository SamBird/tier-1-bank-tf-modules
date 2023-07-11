# main.tf
resource "google_project_iam_member" "project_iam_member" {
  project = var.project_id
  role    = var.role
  member  = var.member
}
