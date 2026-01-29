# Outputs for GCP Storage Bucket

output "bucket_name" {
  value       = google_storage_bucket.bucket.name
  description = "The name of the created bucket"
}

output "bucket_url" {
  value       = "gs://${google_storage_bucket.bucket.name}"
  description = "The GCS URL of the bucket"
}

output "bucket_self_link" {
  value       = google_storage_bucket.bucket.self_link
  description = "The self link of the bucket"
}

output "bucket_location" {
  value       = google_storage_bucket.bucket.location
  description = "The location of the bucket"
}
