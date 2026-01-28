-- Find inactive users (no activity in last 30 days)
SELECT user_id, last_login
FROM users
WHERE last_login < DATE_SUB(CURDATE(), INTERVAL 30 DAY);