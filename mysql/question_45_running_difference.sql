-- Calculate running difference between consecutive rows
SELECT day, value,
       value - LAG(value) OVER (ORDER BY day) AS daily_difference
FROM metrics;