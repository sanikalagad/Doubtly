-- session_participants.sql
CREATE TABLE IF NOT EXISTS session_participants (
    id         BIGINT   NOT NULL AUTO_INCREMENT,
    session_id BIGINT   NOT NULL,
    user_id    BIGINT   NOT NULL,
    role       VARCHAR(20) NOT NULL DEFAULT 'PARTICIPANT',
    joined_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_session_participants (session_id, user_id),
    CONSTRAINT fk_session_participants_session FOREIGN KEY (session_id) REFERENCES sessions (id) ON DELETE CASCADE,
    CONSTRAINT fk_session_participants_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT chk_session_participants_role CHECK (role IN ('HOST', 'COHOST', 'PARTICIPANT'))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
