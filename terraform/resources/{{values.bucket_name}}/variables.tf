# Variables for GCP Storage Bucket
# Values are templated from Backstage

variable "bucket_name" {
  type        = string
  description = "Name of the storage bucket"
  default     = "backstage-demo-gcp-bucket-22"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "fast-pagoda-474409-c7"
}

variable "location" {
  type        = string
  description = "Bucket location"
  default     = "us-central1"
}

variable "storage_class" {
  type        = string
  description = "Storage class for the bucket"
  default     = "STANDARD"
}

variable "environment" {
  type        = string
  description = "Environment tag"
  default     = "dev"
}
