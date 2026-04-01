-- Create tables
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name TEXT,
    country TEXT
);

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    amount REAL,
    type TEXT,
    date TEXT
);

-- Insert data
INSERT INTO users (name, country) VALUES
('John', 'UK'),
('Alice', 'Germany'),
('Bob', 'France'),
('Emma', 'Italy'),
('David', 'Spain');

INSERT INTO transactions (user_id, amount, type, date) VALUES
(1, 100, 'bet', '2026-03-01'),
(1, 50, 'win', '2026-03-01'),
(2, 200, 'bet', '2026-03-02'),
(2, 0, 'win', '2026-03-02');

-- Example query
SELECT u.name, t.amount
FROM users u
JOIN transactions t ON u.user_id = t.user_id;