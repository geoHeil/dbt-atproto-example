# dbt-atproto example

showcasing how to use [dbt-atproto](https://github.com/geoHeil/dbt-atproto) on [duckdb](https://duckdb.org/) via [dbt](https://www.getdbt.com/) based on the great [dbt-duckdb](https://github.com/duckdb/dbt-duckdb) adapter

## prerequisites

- [pixi](https://pixi.sh/latest/) is installed: `curl -fsSL https://pixi.sh/install.sh | bash`

## usage

Run the example commands and attach the remote duckdb instance with the data from the firehose (https://hive.buz.dev/bluesky/catalog)

```bash
pixi run shell
```
in a 2nd shell
```bash
duckdb -c "$(curl -s https://skyfirehose.com/bootstrap.sql)" 
```

Then inside the duckdb shell:

```sql
SHOW ALL TABLES;
SELECT * FROM jetstream_sample;

ATTACH 'https://hive.buz.dev/bluesky/catalog' AS bsky;
SELECT * FROM bsky.jetstream LIMIT 5;
DESCRIBE bsky.jetstream;


-- paste the secret now from the 2nd terminal
ATTACH 'https://skyfirehose.com/database' AS bluesky; 
SELECT * FROM bluesky.schema;

SELECT count(*) FROM bluesky.likes WHERE event_dt = '2024-11-18' and event_hour = '12';
select * from bluesky.jetstream limit 10;
```