-- sessions.sql
CREATE TABLE IF NOT EXISTS sessions (
    id               BIGINT       NOT NULL AUTO_INCREMENT,
    title            VARCHAR(255) NOT NULL,
    description      TEXT,
    host_id          BIGINT       NOT NULL,
    category_id      BIGINT,
    scheduled_at     DATETIME     NOT NULL,
    duration_minutes INT          NOT NULL DEFAULT 60,
    status           VARCHAR(20)  NOT NULL DEFAULT 'SCHEDULED',
    created_at       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_sessions_host (host_id),
    KEY idx_sessions_category (category_id),
    CONSTRAINT fk_sessions_host FOREIGN KEY (host_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_sessions_category FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL,
    CONSTRAINT chk_sessions_status CHECK (status IN ('SCHEDULED', 'LIVE', 'COMPLETED', 'CANCELLED'))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
