# Runbook - Clinical Insights Data Lake

## Deployment Steps
1. Deploy terraform to create S3 buckets + KMS + IAM roles.
2. Upload sample healthcare data (CSV/JSON) into the landing bucket.
3. Run Glue crawler to register schema in Glue Data Catalog.
4. Execute Glue ETL job to create curated Parquet partitions.
5. Query data with Athena using sample SQL.
6. Build dashboards in QuickSight.

## Security
- S3 encrypted with SSE-KMS
- IAM least privilege policies
- CloudTrail enabled
