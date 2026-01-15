SELECT * FROM {{ ref('dim_bigquery') }}
WHERE total_bytes_processed < 1