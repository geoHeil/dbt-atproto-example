SELECT * FROM (
  {{ dbt_atproto.duckdb__search_posts('qxip.bsky.social', max=5) }}
)