-- Calculate cumulative sum with reset on condition
SELECT employee_id, salary,
       SUM(salary) OVER (ORDER BY employee_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_salary
FROM employees;