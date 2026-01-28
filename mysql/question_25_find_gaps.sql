-- Find gaps in a sequence of numbers
SELECT a.number + 1 AS missing_number
FROM numbers a
WHERE NOT EXISTS (
    SELECT 1 FROM numbers b WHERE b.number = a.number + 1
);