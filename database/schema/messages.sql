-- messages.sql
CREATE TABLE IF NOT EXISTS messages (
    id         BIGINT    NOT NULL AUTO_INCREMENT,
    chat_id    BIGINT    NOT NULL,
    sender_id  BIGINT    NOT NULL,
    content    TEXT      NOT NULL,
    sent_at    DATETIME  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_read    BOOLEAN   NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    KEY idx_messages_chat (chat_id),
    KEY idx_messages_sender (sender_id),
    CONSTRAINT fk_messages_chat FOREIGN KEY (chat_id) REFERENCES chats (id) ON DELETE CASCADE,
    CONSTRAINT fk_messages_sender FOREIGN KEY (sender_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
