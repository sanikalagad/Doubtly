# Database

Reference schema, migrations and sample data for Doubtly (MySQL 8).

## Contents

- `schema/` — one DDL file per table. Apply in dependency order:
  `users`, `categories`, `questions`, `answers`, `reviews`, `chats`, `messages`,
  `sessions`, `session_participants`, `study_groups`, `group_members`, `rewards`,
  `redemptions`.
- `migrations/` — versioned change scripts for schema evolution.
- `seed_data/` — sample data for local development (never load in production).

The same schema is available to the Spring Boot application as a Flyway
migration at `backend/src/main/resources/db/migration/V1__create_schema.sql`.
