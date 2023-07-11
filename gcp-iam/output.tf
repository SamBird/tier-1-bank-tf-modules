# outputs.tf
output "iam_member" {
  value = google_project_iam_member.project_iam_member
}