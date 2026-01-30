SELECT
  job_id
  ,user_email
  ,project_id
  ,CAST(creation_time AS TIMESTAMP) AS creation_time
  ,CAST(start_time AS TIMESTAMP) AS start_time
  ,CAST(end_time AS TIMESTAMP) AS end_time
  ,job_type
  ,statement_type
  ,query
  ,CAST(total_bytes_processed AS INT64) AS total_bytes_processed
  ,CAST(total_bytes_billed AS INT64) AS total_bytes_billed
  ,slot_ms
  ,cache_hit
  ,state
FROM {{ source('raw','mock_bigquery_job') }}
