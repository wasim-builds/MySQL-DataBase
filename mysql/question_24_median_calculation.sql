-- Find the median salary using window functions
SELECT AVG(salary) AS median_salary
FROM (SELECT salary, ROW_NUMBER() OVER (ORDER BY salary) AS row_num,
             COUNT(*) OVER () AS total_count
      FROM employees) sub
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);