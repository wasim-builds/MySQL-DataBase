-- Find the busiest hour of the day from event logs
SELECT HOUR(event_time) AS hour, COUNT(*) AS event_count
FROM event_logs
GROUP BY HOUR(event_time)
ORDER BY event_count DESC
LIMIT 1;