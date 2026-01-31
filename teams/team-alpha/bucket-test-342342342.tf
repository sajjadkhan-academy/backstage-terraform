# GCP Bucket provisioned via Backstage
# Bucket Name: test-342342342
# Team: team-alpha
# Created by Backstage Software Template

module "bucket_test_342342342" {
  source = "github.com/sajjadkhan-academy/backstage-terraform//modules/gcp-bucket?ref=main"

  name       = "test-342342342"
  project_id = "fast-pagoda-474409-c7"
  location   = "US"

  labels = {
    managed_by = "backstage"
    team       = "team-alpha"
  }
}
