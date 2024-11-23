
{{ config(materialized='table') }}
SELECT * FROM bsky.jetstream LIMIT 10