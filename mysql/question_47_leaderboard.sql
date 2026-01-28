-- Implement leaderboard with ranking (RANK, DENSE_RANK, ROW_NUMBER)
SELECT player_name, score,
       RANK() OVER (ORDER BY score DESC) AS rank,
       DENSE_RANK() OVER (ORDER BY score DESC) AS dense_rank,
       ROW_NUMBER() OVER (ORDER BY score DESC) AS row_number
FROM player_scores;