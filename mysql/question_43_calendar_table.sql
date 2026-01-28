-- Generate a calendar table for date ranges
WITH RECURSIVE calendar AS (
    SELECT DATE('2024-01-01') AS date
    UNION ALL
    SELECT DATE_ADD(date, INTERVAL 1 DAY)
    FROM calendar
    WHERE date < '2024-12-31'
)
SELECT date, DAYNAME(date) AS day_name, WEEK(date) AS week_number
FROM calendar;