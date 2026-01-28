-- Implement recommendation system query (find similar users based on preferences)
WITH user_similarity AS (
    SELECT u1.user_id AS user1, u2.user_id AS user2,
           COUNT(DISTINCT u1.preference_id) AS common_preferences
    FROM user_preferences u1
    JOIN user_preferences u2 ON u1.preference_id = u2.preference_id
                              AND u1.user_id < u2.user_id
    GROUP BY u1.user_id, u2.user_id
)
SELECT * FROM user_similarity
ORDER BY common_preferences DESC
LIMIT 10;