# Input variables for GCP Bucket Module

variable "name" {
  description = "The name of the bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-_]{1,61}[a-z0-9]$", var.name))
    error_message = "Bucket name must be 3-63 characters, start and end with alphanumeric, and contain only lowercase letters, numbers, hyphens, and underscores."
  }
}

variable "project_id" {
  description = "The GCP project ID where the bucket will be created"
  type        = string
}

variable "location" {
  description = "The location/region for the bucket"
  type        = string
  default     = "US"
}

variable "prefix" {
  description = "Optional prefix for the bucket name"
  type        = string
  default     = ""
}

variable "storage_class" {
  description = "The storage class of the bucket"
  type        = string
  default     = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "NEARLINE", "COLDLINE", "ARCHIVE"], var.storage_class)
    error_message = "Storage class must be one of: STANDARD, NEARLINE, COLDLINE, ARCHIVE."
  }
}

variable "enable_versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "labels" {
  description = "Labels to apply to the bucket for cost tracking"
  type        = map(string)
  default     = {}
}
