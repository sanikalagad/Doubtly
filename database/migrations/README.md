# Migrations

Place versioned, forward-only SQL scripts here, for example:

```text
V1__create_schema.sql
V2__add_index_to_questions.sql
```

The runtime migrations used by the backend live in
`backend/src/main/resources/db/migration/` so Flyway can find them on the
classpath. Keep this folder for design/reference copies and manually applied
changes.
