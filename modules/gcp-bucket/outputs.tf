# Outputs for GCP Bucket Module

output "bucket_name" {
  description = "The name of the created bucket"
  value       = module.cloud_storage.name
}

output "bucket_url" {
  description = "The base URL of the bucket in format gs://bucket-name"
  value       = module.cloud_storage.url
}

output "bucket_self_link" {
  description = "The self link of the bucket"
  value       = module.cloud_storage.bucket.self_link
}
