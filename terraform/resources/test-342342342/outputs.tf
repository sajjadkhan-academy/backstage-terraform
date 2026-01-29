# Outputs for GCP Storage Bucket

output "bucket_name" {
  value       = module.gcp_bucket.bucket_name
  description = "The name of the created bucket"
}

output "bucket_url" {
  value       = module.gcp_bucket.bucket_url
  description = "The GCS URL of the bucket"
}

output "bucket_self_link" {
  value       = module.gcp_bucket.bucket_self_link
  description = "The self link of the bucket"
}

output "bucket_location" {
  value       = module.gcp_bucket.bucket_location
  description = "The location of the bucket"
}
