# Troubleshooting

| Symptom | Likely cause | Mitigation |
|---------|--------------|------------|
| `Unable to locate a Java Runtime` | JDK 25 not installed / wrong `JAVA_HOME` | Install Temurin 25; export `JAVA_HOME` |
| Gradle wrapper missing jars | Wrapper not initialized | Run `./gradle/init-gradle-wrapper.sh` |
| Build OOM | Default Gradle heap | Raise `org.gradle.jvmargs` in `gradle.properties` |
| DB connection failures (Postgres demo) | `ofbiz` started before DB ready / wrong env | Check `docker compose logs db`; confirm env files |
| Permission errors on `./logs` | Container uid 1000 cannot write host dir | Fix ownership per `DOCKER.adoc` notes |
| Port 8443 in use | Another OFBiz/Docker instance | Stop conflict or change publish ports in compose (compose edit is env-specific; prefer stopping conflict) |
| Entity load errors | Incomplete `loadAll` / mismatched DB | Re-run data load; confirm datasource matches DB product |
| JMS errors | Broker not available while JMS enabled | Disable JMS or provision broker — details unavailable / requires further investigation |

## Phase 1 limitation

No live failure catalog was captured because the application was not started on the documentation host.
