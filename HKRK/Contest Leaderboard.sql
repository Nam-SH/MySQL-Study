SELECT H.hacker_id, H.name, SUM(S.max_score) AS sum_max_score
FROM Hackers H
    INNER JOIN (SELECT hacker_id, challenge_id, max(score) AS max_score 
                FROM Submissions GROUP BY hacker_id, challenge_id) S
                ON S.hacker_id = H.hacker_id
GROUP BY H.hacker_id, H.name     
HAVING sum_max_score <> 0
ORDER BY sum_max_score DESC, H.hacker_id