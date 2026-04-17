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

SELECT u.name, SUM(t.amount) AS total_spent
FROM users u
JOIN transactions t ON u.user_id = t.user_id
WHERE t.type = 'bet'
GROUP BY u.name;

SELECT u.name, SUM(t.amount) AS total_spent
FROM users u
JOIN transactions t ON u.user_id = t.user_id
WHERE t.type = 'bet'
GROUP BY u.name
ORDER BY total_spent DESC
LIMIT 1;

SELECT u.name
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.name
HAVING SUM(CASE WHEN t.type = 'win' THEN t.amount ELSE 0 END) = 0;

SELECT date, SUM(amount) AS total_bets
FROM transactions
WHERE type = 'bet'
GROUP BY date;

SELECT u.name, t.amount, t.type
FROM users u
JOIN transactions t ON u.user_id = t.user_id;

SELECT u.name, SUM(t.amount) AS total_bet
FROM users u
JOIN transactions t ON u.user_id = t.user_id
WHERE t.type = 'bet'
GROUP BY u.name;

SELECT u.name, SUM(t.amount) AS total_bet
FROM users u
JOIN transactions t ON u.user_id = t.user_id
WHERE t.type = 'bet'
GROUP BY u.name
ORDER BY total_bet DESC
LIMIT 1;

SELECT u.name
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.name
HAVING SUM(CASE WHEN t.type = 'win' THEN t.amount ELSE 0 END) = 0;

SELECT date, SUM(amount) AS total_bets
FROM transactions
WHERE type = 'bet'
GROUP BY date;

SELECT 
    u.country,
    SUM(CASE WHEN t.type='bet' THEN t.amount ELSE 0 END) -
    SUM(CASE WHEN t.type='win' THEN t.amount ELSE 0 END) AS GGR
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.country;

SELECT 
    u.country,
    SUM(CASE WHEN t.type='bet' THEN t.amount ELSE 0 END) -
    SUM(CASE WHEN t.type='win' THEN t.amount ELSE 0 END) AS GGR
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.country
ORDER BY GGR DESC
LIMIT 1;

SELECT u.name, COUNT(*) AS total_transactions
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.name
HAVING total_transactions > 2;

SELECT * FROM transactions WHERE type = 'win';

SELECT SUM(amount) FROM transactions WHERE type = 'win';

SELECT u.name, SUM(t.amount)
FROM users u
JOIN transactions t ON u.user_id = t.user_id
WHERE t.type = 'bet'
GROUP BY u.name;

SELECT u.name, SUM(t.amount) AS total_bet
FROM users u
JOIN transactions t ON u.user_id = t.user_id
WHERE t.type = 'bet'
GROUP BY u.name
ORDER BY total_bet DESC
LIMIT 1;

SELECT u.name, COUNT(*) AS total_transactions
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.name;

SELECT u.name, COUNT(*) AS total_transactions
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.name
HAVING total_transactions > 2;

SELECT 
    u.name,
    SUM(CASE WHEN t.type='bet' THEN t.amount ELSE 0 END) AS total_bet,
    SUM(CASE WHEN t.type='win' THEN t.amount ELSE 0 END) AS total_win
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.name;

SELECT 
    u.name,
    SUM(CASE WHEN t.type='bet' THEN t.amount ELSE 0 END) AS total_bet,
    SUM(CASE WHEN t.type='win' THEN t.amount ELSE 0 END) AS total_win
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.name
HAVING total_win > total_bet;