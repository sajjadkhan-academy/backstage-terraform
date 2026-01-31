# GCP Cloud Storage Bucket Module
# This is the "Golden Path" blueprint for creating secure GCS buckets

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

module "cloud_storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 5.0"

  project_id = var.project_id
  names      = [var.name]
  prefix     = var.prefix
  location   = var.location

  # Security Best Practice: Prevent public access by default
  public_access_prevention = "enforced"

  # Standard storage class for general use
  storage_class = var.storage_class

  # Enable versioning for data protection
  versioning = {
    (var.name) = var.enable_versioning
  }

  # Uniform bucket-level access for consistent permissions
  bucket_policy_only = {
    (var.name) = true
  }

  # Labels for cost tracking and organization
  labels = var.labels
}
