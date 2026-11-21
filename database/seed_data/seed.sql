-- seed.sql — sample data for local development only.
-- Passwords below are bcrypt hashes of "password123".

INSERT INTO users (username, email, password_hash, full_name, role, points, level)
VALUES
    ('alice', 'alice@example.com', '$2a$10$7EqJtq98hPqEX7fNZaFWoO5HqP7s5F5Q0VJ0Y7f0tR5y7Bq9zK2i', 'Alice Sharma', 'STUDENT', 120, 2),
    ('bob', 'bob@example.com', '$2a$10$7EqJtq98hPqEX7fNZaFWoO5HqP7s5F5Q0VJ0Y7f0tR5y7Bq9zK2i', 'Bob Patil', 'STUDENT', 75, 1),
    ('moderator', 'mod@example.com', '$2a$10$7EqJtq98hPqEX7fNZaFWoO5HqP7s5F5Q0VJ0Y7f0tR5y7Bq9zK2i', 'Moderator', 'MODERATOR', 500, 5);

INSERT INTO categories (name, slug, description, icon)
VALUES
    ('Mathematics', 'mathematics', 'Algebra, calculus and more', 'calculator'),
    ('Computer Science', 'computer-science', 'Programming, algorithms and systems', 'laptop'),
    ('Physics', 'physics', 'Mechanics, thermodynamics and beyond', 'atom');

INSERT INTO questions (user_id, category_id, title, body, tags)
VALUES
    (1, 1, 'How do I solve this quadratic equation?', 'I am stuck on factoring x^2 - 5x + 6 = 0.', 'algebra,math'),
    (2, 2, 'Difference between a process and a thread?', 'Can someone explain with a real-world example?', 'os,concepts');

INSERT INTO answers (question_id, user_id, body, is_accepted)
VALUES
    (1, 3, 'Find two numbers that multiply to 6 and add to -5: -2 and -3. So x = 2 or x = 3.', TRUE),
    (2, 3, 'A process is an independent program in execution; threads are lightweight units within a process.', FALSE);

INSERT INTO rewards (name, description, points_required, badge_icon, stock)
VALUES
    ('Helper Badge', 'Awarded for answering 10 questions', 100, 'badge-helper.png', 100),
    ('Top Contributor', 'Awarded for reaching 500 points', 500, 'badge-top.png', 25);
