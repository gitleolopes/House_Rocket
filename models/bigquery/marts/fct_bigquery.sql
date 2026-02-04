WITH bq AS(
    SELECT * FROM {{ref("stg_bigquery")}}
)

SELECT
    job_id
    ,user_email
    ,project_id
    ,CAST(creation_time AS DATE) AS creation_time
    ,query
    ,total_bytes_processed
FROM bq
WHERE statement_type IS NULL OR statement_type != 'SCRIPT' 