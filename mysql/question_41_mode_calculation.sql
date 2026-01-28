-- Find the mode (most frequent value)
SELECT value, COUNT(*) AS frequency
FROM data_values
GROUP BY value
ORDER BY frequency DESC
LIMIT 1;