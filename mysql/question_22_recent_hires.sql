-- Find employees hired in last 90 days using DATE_SUB
SELECT *
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY);