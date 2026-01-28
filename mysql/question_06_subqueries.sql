-- Question: Find employees who earn more than the average salary
-- Sample Data:
-- CREATE TABLE employees (id INT, name VARCHAR(100), salary INT);
-- INSERT INTO employees VALUES (1, 'John', 60000), (2, 'Jane', 40000), (3, 'Alice', 55000);

-- Solution:
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Explanation: This query uses a subquery to find employees whose salary is above the average salary.