# Backend database layer

This package is the backend's database layer. It complements the top-level
`database/` folder (which holds the reference schema and seed scripts) with the
runtime pieces used by the Spring Boot application.

## Contents

| Path | Purpose |
| --- | --- |
| `src/main/java/com/doubtly/database/config/DatabaseConfig.java` | Enables typed database properties; datasource/JPA are auto-configured by Spring Boot |
| `src/main/java/com/doubtly/database/config/DatabaseProperties.java` | Typed `doubtly.database.*` settings |
| `src/main/java/com/doubtly/database/config/JpaConfig.java` | Enables JPA auditing (`@CreatedDate`, `@LastModifiedDate`) |
| `src/main/resources/db/migration/` | Flyway migrations applied on startup |
| `src/main/resources/db/seed/` | Optional seed SQL for local development |

Layers in `com.doubtly` work together as follows:

```
controller -> service -> repository -> entity  (JPA / MySQL)
                            |
                      database/config
```

Connection details live in `src/main/resources/application.properties` and can
be overridden with the `DB_USERNAME`, `DB_PASSWORD`, and `JWT_SECRET`
environment variables.
