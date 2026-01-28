-- Question: Find departments with more than 10 employees
-- Sample Data:
-- CREATE TABLE departments (dept_id INT, dept_name VARCHAR(100));
-- CREATE TABLE employees (emp_id INT, dept_id INT);
-- INSERT INTO departments VALUES (1, 'HR'), (2, 'Engineering');
-- INSERT INTO employees VALUES (1, 1), (2, 1), (3, 2), (4, 2), (5, 2);

-- Solution:
SELECT d.dept_name, COUNT(e.emp_id) as employee_count
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING employee_count > 10;

-- Explanation: This query finds departments that have more than 10 employees using HAVING clause.