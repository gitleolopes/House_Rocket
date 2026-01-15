WITH bq AS(
    SELECT * FROM {{source('raw','mock_bigquery_job')}}
)

SELECT
    *
FROM bq
