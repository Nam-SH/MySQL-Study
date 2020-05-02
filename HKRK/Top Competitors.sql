SELECT H.hacker_id, H.name
FROM Hackers H
    INNER JOIN Submissions S ON S.hacker_id = H.hacker_id 
    INNER JOIN Challenges C ON C.challenge_id  = S.challenge_id 
    INNER JOIN Difficulty D ON D.difficulty_level = C.difficulty_level
WHERE S.score = D.score AND C.difficulty_level = D.difficulty_level
GROUP BY H.hacker_id, H.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, H.hacker_id