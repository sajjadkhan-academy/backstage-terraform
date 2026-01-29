# GCP Bucket Module Variables

variable "bucket_name" {
  type        = string
  description = "The globally unique name for the bucket"

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-_.]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be 3-63 characters, start/end with letter/number, and contain only lowercase letters, numbers, hyphens, underscores, or periods."
  }
}

variable "project_id" {
  type        = string
  description = "The GCP project ID where the bucket will be created"
}

variable "location" {
  type        = string
  description = "The location for the bucket (region or multi-region)"
  default     = "US"

  validation {
    condition     = contains(["US", "EU", "ASIA", "us-central1", "us-east1", "us-west1", "europe-west1", "asia-east1"], var.location)
    error_message = "Location must be a valid GCS location."
  }
}

variable "storage_class" {
  type        = string
  description = "The storage class of the bucket"
  default     = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "NEARLINE", "COLDLINE", "ARCHIVE"], var.storage_class)
    error_message = "Storage class must be STANDARD, NEARLINE, COLDLINE, or ARCHIVE."
  }
}

variable "enable_versioning" {
  type        = bool
  description = "Enable object versioning for the bucket"
  default     = true
}

variable "lifecycle_rules" {
  type = list(object({
    action_type           = string
    storage_class         = optional(string)
    age_days              = optional(number)
    num_newer_versions    = optional(number)
    with_state            = optional(string)
    matches_storage_class = optional(list(string))
  }))
  description = "List of lifecycle rules for the bucket"
  default = [
    {
      action_type        = "Delete"
      age_days           = 365
      num_newer_versions = 5
      with_state         = "ARCHIVED"
    }
  ]
}

variable "soft_delete_retention_seconds" {
  type        = number
  description = "Soft delete retention period in seconds (7-90 days)"
  default     = 604800 # 7 days

  validation {
    condition     = var.soft_delete_retention_seconds >= 604800 && var.soft_delete_retention_seconds <= 7776000
    error_message = "Soft delete retention must be between 7 days (604800s) and 90 days (7776000s)."
  }
}

variable "environment" {
  type        = string
  description = "Environment tag (dev, staging, prod)"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "labels" {
  type        = map(string)
  description = "Additional labels to apply to the bucket"
  default     = {}
}

variable "force_destroy" {
  type        = bool
  description = "Allow bucket destruction even if it contains objects (dangerous)"
  default     = false
}

variable "prevent_public_access" {
  type        = bool
  description = "Prevent any public access to the bucket"
  default     = true
}
