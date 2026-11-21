-- answers.sql
CREATE TABLE IF NOT EXISTS answers (
    id          BIGINT  NOT NULL AUTO_INCREMENT,
    question_id BIGINT  NOT NULL,
    user_id     BIGINT  NOT NULL,
    body        TEXT    NOT NULL,
    upvotes     INT     NOT NULL DEFAULT 0,
    downvotes   INT     NOT NULL DEFAULT 0,
    is_accepted BOOLEAN NOT NULL DEFAULT FALSE,
    created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_answers_question (question_id),
    KEY idx_answers_user (user_id),
    CONSTRAINT fk_answers_question FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE CASCADE,
    CONSTRAINT fk_answers_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
