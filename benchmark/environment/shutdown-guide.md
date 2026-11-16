# Shutdown guide

## Gradle / foreground process

- Interrupt the `./gradlew ofbiz` process with Ctrl+C.
- Ensure no orphaned Java process remains (`jps`/`ps`) after stop — standard JVM practice.

## Docker Compose

From `docker/examples/postgres-demo`:

```bash
docker compose down
```

Data in Postgres container is ephemeral unless volumes were added (stock compose uses initdb mount but no named data volume for Postgres data — container removal loses DB state). Log bind mount `./logs` persists on host.

## Safe practices for benchmark

- Scripts under `benchmark/scripts/` do **not** perform `docker compose down -v`, image prune, or `cleanAll`.
- Avoid `./gradlew cleanAll` unless intentionally wiping local runtime data.
