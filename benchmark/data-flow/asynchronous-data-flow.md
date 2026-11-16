# Asynchronous data flow

## Job poller / JobSandbox

Configured in `framework/service/config/serviceengine.xml` (thread-pools, purge-job-days, jobs capacity). Deferred and async services are persisted and executed by the job poller inside the same OFBiz process.

Flow:

```
Service invoked with async/delay
  → job row stored via Entity Engine
  → job poller thread picks job
  → service executes → further entity writes (may include PII updates)
```

## JMS (optional)

- `framework/service/config/service.properties`: `enableJMS=true`
- Engine: `org.apache.ofbiz.service.jms.JmsServiceEngine`
- Example config `serviceMessenger` uses JNDI `jms/TopicConnectionFactory` and topic `jms/OFBTopic`

Production broker wiring and whether demo data exercises JMS: unavailable / requires further investigation. No Kafka/RabbitMQ modules found in framework defaults.

## Entity ECAs

Entity Event Condition Actions (`eecas.xml` under several apps) can trigger services on entity changes — an in-process async/reactive style path that may propagate PII updates across entities.

## What is not present

- No first-class Kafka consumer/producer stack in OFBiz core (contrast with ThingsBoard).
- No Redis-backed queue observed in default dependencies.
