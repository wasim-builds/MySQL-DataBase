-- Question: Find employees with a salary greater than 50,000
-- Sample Data: 
-- CREATE TABLE employees (id INT, name VARCHAR(100), salary INT);
-- INSERT INTO employees VALUES (1, 'John', 60000), (2, 'Jane', 40000);

-- Solution:
SELECT * FROM employees WHERE salary > 50000;

-- Explanation: This query retrieves all employees whose salary exceeds 50,000.