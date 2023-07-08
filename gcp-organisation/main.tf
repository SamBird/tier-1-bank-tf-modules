# main.tf

# Create the GCP organization
resource "google_organization" "org" {
  org_id = var.org_id
}

# Assign organization roles to owners
resource "google_organization_iam_binding" "org_owner_roles" {
  for_each = toset(var.org_owners)

  organization = google_organization.org.name
  role         = "roles/owner"
  members      = [each.value]
}

# Assign organization roles to members
resource "google_organization_iam_binding" "org_member_roles" {
  for_each = toset(var.org_members)

  organization = google_organization.org.name
  role         = "roles/resourcemanager.organizationViewer"
  members      = [each.value]
}

# Link the billing account to the organization
resource "google_organization_iam_binding" "billing_account_roles" {
  organization = google_organization.org.name
  role         = "roles/billing.user"
  members      = ["user:${var.billing_account}"]
}
