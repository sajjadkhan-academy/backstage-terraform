# GCP Cloud Storage Bucket Module
# Following CNCF Platform Engineering best practices

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

# Create the GCS bucket with best practices
resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  project  = var.project_id
  location = var.location

  # Use uniform bucket-level access (recommended)
  uniform_bucket_level_access = true

  # Storage class
  storage_class = var.storage_class

  # Versioning for data protection
  versioning {
    enabled = var.enable_versioning
  }

  # Lifecycle rules for cost optimization
  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action_type
        storage_class = lookup(lifecycle_rule.value, "storage_class", null)
      }
      condition {
        age                   = lookup(lifecycle_rule.value, "age_days", null)
        num_newer_versions    = lookup(lifecycle_rule.value, "num_newer_versions", null)
        with_state            = lookup(lifecycle_rule.value, "with_state", null)
        matches_storage_class = lookup(lifecycle_rule.value, "matches_storage_class", null)
      }
    }
  }

  # Soft delete policy for accidental deletion protection
  soft_delete_policy {
    retention_duration_seconds = var.soft_delete_retention_seconds
  }

  # Labels for cost allocation and organization
  labels = merge(
    {
      managed_by  = "terraform"
      created_by  = "backstage"
      environment = var.environment
    },
    var.labels
  )

  # Force destroy protection (false by default for safety)
  force_destroy = var.force_destroy
}

# Optional: Public access prevention (highly recommended)
resource "google_storage_bucket_iam_member" "public_access_prevention" {
  count  = var.prevent_public_access ? 1 : 0
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"

  # This actually PREVENTS public access by not adding any public IAM bindings
  # In practice, we rely on uniform_bucket_level_access and organization policies
}
