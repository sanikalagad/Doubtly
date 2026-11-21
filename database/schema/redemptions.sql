-- redemptions.sql
CREATE TABLE IF NOT EXISTS redemptions (
    id          BIGINT      NOT NULL AUTO_INCREMENT,
    user_id     BIGINT      NOT NULL,
    reward_id   BIGINT      NOT NULL,
    redeemed_at DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status      VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    PRIMARY KEY (id),
    KEY idx_redemptions_user (user_id),
    KEY idx_redemptions_reward (reward_id),
    CONSTRAINT fk_redemptions_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_redemptions_reward FOREIGN KEY (reward_id) REFERENCES rewards (id) ON DELETE CASCADE,
    CONSTRAINT chk_redemptions_status CHECK (status IN ('PENDING', 'FULFILLED', 'CANCELLED'))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
