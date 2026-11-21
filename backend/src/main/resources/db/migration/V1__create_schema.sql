-- ===== users =====
-- users.sql
CREATE TABLE IF NOT EXISTS users (
    id            BIGINT       NOT NULL AUTO_INCREMENT,
    username      VARCHAR(50)  NOT NULL,
    email         VARCHAR(120) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name     VARCHAR(120),
    avatar_url    VARCHAR(255),
    role          VARCHAR(20)  NOT NULL DEFAULT 'STUDENT',
    points        INT          NOT NULL DEFAULT 0,
    level         INT          NOT NULL DEFAULT 1,
    is_active     BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_users_username (username),
    UNIQUE KEY uq_users_email (email),
    CONSTRAINT chk_users_role CHECK (role IN ('STUDENT', 'MODERATOR', 'ADMIN'))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- ===== categories =====
-- categories.sql
CREATE TABLE IF NOT EXISTS categories (
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    slug        VARCHAR(120) NOT NULL,
    description TEXT,
    icon        VARCHAR(255),
    created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_categories_slug (slug)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- ===== questions =====
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

-- ===== answers =====
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

-- ===== reviews =====
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

-- ===== chats =====
-- chats.sql
CREATE TABLE IF NOT EXISTS chats (
    id         BIGINT       NOT NULL AUTO_INCREMENT,
    name       VARCHAR(150),
    type       VARCHAR(20)  NOT NULL DEFAULT 'DIRECT',
    created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT chk_chats_type CHECK (type IN ('DIRECT', 'GROUP'))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- ===== messages =====
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

-- ===== sessions =====
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

-- ===== session_participants =====
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

-- ===== study_groups =====
-- study_groups.sql
CREATE TABLE IF NOT EXISTS study_groups (
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    name        VARCHAR(150) NOT NULL,
    description TEXT,
    category_id BIGINT,
    created_by  BIGINT       NOT NULL,
    created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_study_groups_category (category_id),
    KEY idx_study_groups_creator (created_by),
    CONSTRAINT fk_study_groups_category FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL,
    CONSTRAINT fk_study_groups_creator FOREIGN KEY (created_by) REFERENCES users (id) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- ===== group_members =====
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

-- ===== rewards =====
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

-- ===== redemptions =====
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
