-- group_members.sql
CREATE TABLE IF NOT EXISTS group_members (
    id        BIGINT      NOT NULL AUTO_INCREMENT,
    group_id  BIGINT      NOT NULL,
    user_id   BIGINT      NOT NULL,
    role      VARCHAR(20) NOT NULL DEFAULT 'MEMBER',
    joined_at DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_group_members (group_id, user_id),
    CONSTRAINT fk_group_members_group FOREIGN KEY (group_id) REFERENCES study_groups (id) ON DELETE CASCADE,
    CONSTRAINT fk_group_members_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT chk_group_members_role CHECK (role IN ('ADMIN', 'MODERATOR', 'MEMBER'))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
