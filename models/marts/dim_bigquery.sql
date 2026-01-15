WITH bq AS(
    SELECT * FROM {{ref("stg_bigquery")}}
)

SELECT
    job_id
    ,user_email
    ,project_id
    ,creation_time
    ,statement_type
    ,query
    ,total_bytes_processed
FROM bq
WHERE statement_type IS NULL OR statement_type != 'SCRIPT'