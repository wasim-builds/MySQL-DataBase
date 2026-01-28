-- Implement full-text search on articles
SELECT article_id, title, MATCH(title, content) AGAINST('MySQL database' IN NATURAL LANGUAGE MODE) AS relevance
FROM articles
WHERE MATCH(title, content) AGAINST('MySQL database' IN NATURAL LANGUAGE MODE)
ORDER BY relevance DESC;