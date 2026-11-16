# Known limitations

1. **Startup not verified** — documentation-only Phase 1 on a host without JDK 25.
2. **Plugins absent** — `pullPluginSource.sh` not executed; plugin entities/services unknown.
3. **INSTALL vs README JDK mismatch** — INSTALL mentions 17; trunk build uses 25.
4. **JMS broker** — configuration exists; live broker not provisioned or tested.
5. **OLAP/tenant PII projection** — separate DBs configured; field-level PII mapping not fully traced.
6. **REST catalog** — exhaustive path→entity map not generated.
7. **Demo credentials in compose env files** — example secrets only; unsuitable for shared/prod use.
8. **No benchmark docker-compose added** — upstream postgres-demo preferred per Phase 1 rules.
