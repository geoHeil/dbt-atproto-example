# dbt-atproto example

showcasing how to use [dbt-atproto](https://github.com/geoHeil/dbt-atproto) on [duckdb](https://duckdb.org/) via [dbt](https://www.getdbt.com/) based on the great [dbt-duckdb](https://github.com/duckdb/dbt-duckdb) adapter

## prerequisites

- [pixi](https://pixi.sh/latest/) is installed: `curl -fsSL https://pixi.sh/install.sh | bash`

## usage

Run the example commands and attach the remote duckdb instance with the data from the firehose (https://hive.buz.dev/bluesky/catalog)

```bash
pixi run shell
```

Then inside the duckdb shell:

```sql
SHOW ALL TABLES;
SELECT * FROM jetstream_sample;

ATTACH 'https://hive.buz.dev/bluesky/catalog' AS bsky;
SELECT * FROM bsky.jetstream LIMIT 5;
```