-- questions.sql
CREATE TABLE IF NOT EXISTS questions (
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    user_id     BIGINT       NOT NULL,
    category_id BIGINT,
    title       VARCHAR(255) NOT NULL,
    body        TEXT         NOT NULL,
    tags        VARCHAR(255),
    views       INT          NOT NULL DEFAULT 0,
    upvotes     INT          NOT NULL DEFAULT 0,
    downvotes   INT          NOT NULL DEFAULT 0,
    is_solved   BOOLEAN      NOT NULL DEFAULT FALSE,
    created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_questions_user (user_id),
    KEY idx_questions_category (category_id),
    CONSTRAINT fk_questions_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_questions_category FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
