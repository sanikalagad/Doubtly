# Doubtly

A collaborative learning platform where students can ask questions, share answers, join study groups, attend live sessions, chat with peers, and earn rewards for helping others.

## Project structure

```text
Doubtly/
├── frontend/                       # React + Vite single-page application
│   ├── public/
│   └── src/
│       ├── assets/
│       ├── components/
│       │   ├── Navbar/
│       │   ├── QuestionCard/
│       │   ├── AnswerCard/
│       │   ├── ChatBox/
│       │   └── Leaderboard/
│       ├── pages/
│       │   ├── Login/
│       │   ├── Register/
│       │   ├── Dashboard/
│       │   ├── Questions/
│       │   ├── Categories/
│       │   ├── StudyGroups/
│       │   ├── Chat/
│       │   ├── Rewards/
│       │   └── Profile/
│       ├── services/               # API clients
│       ├── hooks/                  # Custom React hooks
│       ├── context/                # React context providers
│       ├── utils/                  # Helpers and constants
│       ├── App.jsx
│       └── main.jsx
│   └── package.json
│
├── backend/                        # Spring Boot REST API (Java 17)
│   ├── src/main/
│   │   ├── java/com/doubtly/
│   │   │   ├── config/             # Application-wide configuration
│   │   │   ├── security/           # Authentication and authorization
│   │   │   ├── controller/         # REST controllers
│   │   │   ├── service/            # Business logic
│   │   │   ├── repository/         # Spring Data JPA repositories
│   │   │   ├── entity/             # JPA entities
│   │   │   ├── dto/                # Request/response DTOs
│   │   │   ├── exception/          # Exceptions and handlers
│   │   │   ├── database/           # Database layer (added)
│   │   │   │   ├── config/         # DataSource / JPA / DB properties
│   │   │   │   └── README.md
│   │   │   └── DoubtlyApplication.java
│   │   └── resources/
│   │       ├── db/migration/       # Flyway migrations
│   │       ├── db/seed/            # Optional seed data
│   │       └── application.properties
│   └── pom.xml
│
├── database/                       # Database schema, migrations and seed data
│   ├── schema/
│   │   ├── users.sql
│   │   ├── questions.sql
│   │   ├── answers.sql
│   │   ├── reviews.sql
│   │   ├── categories.sql
│   │   ├── chats.sql
│   │   ├── messages.sql
│   │   ├── sessions.sql
│   │   ├── session_participants.sql
│   │   ├── study_groups.sql
│   │   ├── group_members.sql
│   │   ├── rewards.sql
│   │   └── redemptions.sql
│   ├── migrations/
│   └── seed_data/
│
├── docs/
│   ├── ER_Diagram/
│   ├── UML_Diagrams/
│   ├── Use_Case_Diagram/
│   ├── DFD/
│   ├── Project_Report/
│   └── API_Documentation/
│
├── tests/
│   ├── frontend/
│   ├── backend/
│   └── integration/
│
├── .gitignore
├── LICENSE
└── README.md
```

## Getting started

### Frontend

```bash
cd frontend
npm install
npm run dev
```

### Backend

```bash
cd backend
mvn spring-boot:run
```

The backend expects a MySQL 8 database named `doubtly`. Configure it with the
`DB_USERNAME`, `DB_PASSWORD`, and `JWT_SECRET` environment variables, or edit
`backend/src/main/resources/application.properties`. Flyway applies the schema
from `backend/src/main/resources/db/migration` on startup.

## License

MIT — see [LICENSE](LICENSE).
