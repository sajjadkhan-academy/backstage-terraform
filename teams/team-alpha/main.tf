# Team Alpha - Terraform Configuration
# This file manages the backend and provider configuration for team-alpha

terraform {
  required_version = ">= 1.0.0"

  # GCS backend for remote state storage
  # Each team has an isolated state prefix
  backend "gcs" {
    bucket = "terraform-state-backtage-demo"
    prefix = "terraform/state/team-alpha"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

# Configure the Google Cloud Provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Variables for this team's configuration
variable "project_id" {
  description = "The GCP project ID for team-alpha resources"
  type        = string
  default     = "fast-pagoda-474409-c7" # Default project ID
}

variable "region" {
  description = "The default region for resources"
  type        = string
  default     = "us-central1"
}
