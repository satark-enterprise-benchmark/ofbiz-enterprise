# Technology stack (verified)

Sources: `README.md`, `INSTALL`, `build.gradle`, `dependencies.gradle`, `framework/entity/config/entityengine.xml`, `DOCKER.adoc`.

## Runtime

| Layer | Technology | Evidence |
|-------|------------|----------|
| Language | Java 25 | `build.gradle` `sourceCompatibility`/`targetCompatibility` = `VERSION_25`; README system requirements |
| Build | Gradle Wrapper | `gradlew`, `build.gradle`, `settings.gradle` |
| Web container | Apache Tomcat (embedded via Catalina) | `framework/catalina`, `libs.tomcat.*` |
| Persistence | OFBiz Entity Engine over JDBC | `framework/entity` |
| Default DB | H2 file DB | `runtimeOnly libs.h2`; `localh2` datasource |
| Optional DB | PostgreSQL, MySQL | field-type maps + Docker postgres example |
| Templating | FreeMarker, Groovy | dependencies + minilang/groovy services |
| Logging | Log4j 2 | `libs.log4j.*` |
| Security libs | Apache Shiro, ESAPI, JWT | `dependencies.gradle` |
| REST | CXF / Jersey / Swagger bundles | `dependencies.gradle` |
| Transactions | Geronimo transaction + JMS spec | `dependencies.gradle` |

## Front-end

Server-rendered OFBiz widgets/screens/forms (FreeMarker/XML), not a separate SPA. Themes under `themes/`.

## Messaging / async

| Mechanism | Status |
|-----------|--------|
| JobSandbox + job poller | Built-in Service Engine (`serviceengine.xml`) |
| JMS | Optional (`enableJMS=true` in `service.properties`; `jms` engine + `serviceMessenger` topic config) |

## Not present / not default

- No Kafka/RabbitMQ as first-class OFBiz queue (unlike ThingsBoard).
- No Redis/Cassandra in default stack.
- Plugins repo not included in this clone.
