-- Pivot data from rows to columns using CASE statements
SELECT department,
       SUM(CASE WHEN employee_status = 'Active' THEN 1 ELSE 0 END) AS active_count,
       SUM(CASE WHEN employee_status = 'Inactive' THEN 1 ELSE 0 END) AS inactive_count
FROM employees
GROUP BY department;