{{
    config(
        partition_by = {
            'field' : 'creation_date',
            'data_type' : 'date',
            'granularity' : 'day'
        }
        ,cluster_by = [
            'project_id'
        ]
    )
}}


WITH bq AS(
    SELECT * FROM {{ref("stg_bigquery")}}
)

SELECT
    job_id
    ,user_email
    ,{{anonymize("user_email")}} as anonymized_email
    ,project_id
    ,CAST(creation_time AS DATE) AS creation_date
    ,query
    ,total_bytes_processed
FROM bq
WHERE statement_type IS NULL OR statement_type != 'SCRIPT' 