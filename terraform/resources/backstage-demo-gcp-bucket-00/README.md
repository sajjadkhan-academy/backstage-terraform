# GCP Storage Bucket: backstage-demo-gcp-bucket-00

Infrastructure-as-Code repository for provisioning a GCP Cloud Storage bucket.

## Overview

| Property | Value |
|----------|-------|
| **Bucket Name** | `backstage-demo-gcp-bucket-00` |
| **Project** | `fast-pagoda-474409-c7` |
| **Location** | us-central1 |
| **Storage Class** | STANDARD |
| **Environment** | dev |

## Description

test

## Getting Started

### Prerequisites

1. GCP Project with Cloud Storage API enabled
2. GitHub repository secrets configured:
   - `GCP_PROJECT_ID` - Your GCP project ID
   - `WORKLOAD_IDENTITY_PROVIDER` - Workload Identity Federation provider
   - `SERVICE_ACCOUNT_EMAIL` - Service account with Storage Admin role

### Provisioning

Push to `main` branch to trigger the Terraform workflow:

```bash
git push origin main
```

### Manual Commands

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   GitHub Repo   │────>│  GitHub Actions │────>│   GCP Bucket    │
│  (This Repo)    │     │  (Terraform)    │     │  backstage-demo-gcp-bucket-00    │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

## Files

- `terraform/` - Terraform configuration
- `.github/workflows/` - CI/CD pipelines
- `catalog-info.yaml` - Backstage catalog entry

## Created By

This repository was created using the Backstage GCP Storage Bucket template.

- **Managed by**: Terraform
- **Created by**: Backstage IDP
