-- reviews.sql
CREATE TABLE IF NOT EXISTS reviews (
    id          BIGINT   NOT NULL AUTO_INCREMENT,
    answer_id   BIGINT   NOT NULL,
    reviewer_id BIGINT   NOT NULL,
    rating      SMALLINT NOT NULL,
    comment     TEXT,
    created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_reviews_answer_reviewer (answer_id, reviewer_id),
    CONSTRAINT fk_reviews_answer FOREIGN KEY (answer_id) REFERENCES answers (id) ON DELETE CASCADE,
    CONSTRAINT fk_reviews_reviewer FOREIGN KEY (reviewer_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT chk_reviews_rating CHECK (rating BETWEEN 1 AND 5)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
