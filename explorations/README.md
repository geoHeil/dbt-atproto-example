# Bsky explorations around duckdb

## feed providers

- https://skyfirehose.com/database via https://skyfirehose.com
- https://hive.buz.dev/bluesky/catalog via https://buz.dev
- https://huggingface.co/datasets/andrewconner/bluesky_profiles/tree/main


## self reading the feed

```bash
brew install duckdb websocat && \
duckdb -c "CREATE TABLE IF NOT EXISTS messages (
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  raw_json JSON
);" bsky.db && \
websocat wss://jetstream2.us-west.bsky.network/subscribe \
| sed "s/'/''/g; s/^/INSERT INTO messages (raw_json) VALUES ('/; s/$/');/" \
| duckdb bsky.db

duckdb -readonly bsky.db
DESCRIBE messages;
select * from messages limit 5;
```

## links and references

- https://github.com/metrico/quackpipe
- https://github.com/datonic/datadex/commit/a4bc2443e727ca74aa8902b1111fb6e33e5193ae#diff-d20bdb69b83b08498f8ebf2ea19805eea2622c2f490c3c6fb7ddb6b6df6d3a54R8