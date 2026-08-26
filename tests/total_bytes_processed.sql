SELECT * FROM {{ ref('fct_bigquery') }}
WHERE total_bytes_processed <= 0