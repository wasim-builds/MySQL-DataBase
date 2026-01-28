-- Rank employees by salary within each department using RANK() window function
SELECT department, employee_name, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;