-- rewards.sql
CREATE TABLE IF NOT EXISTS rewards (
    id             BIGINT       NOT NULL AUTO_INCREMENT,
    name           VARCHAR(150) NOT NULL,
    description    TEXT,
    points_required INT         NOT NULL DEFAULT 0,
    badge_icon     VARCHAR(255),
    stock          INT          NOT NULL DEFAULT 0,
    created_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
