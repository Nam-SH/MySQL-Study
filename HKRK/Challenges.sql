SELECT H.hacker_id, H.name, COUNT(C.challenge_id) AS cnt
FROM Hackers H
    INNER JOIN Challenges C ON C.hacker_id = H.hacker_id
GROUP BY H.hacker_id, H.name
HAVING cnt = (SELECT COUNT(challenge_id) AS cnt
              FROM Challenges
              GROUP BY hacker_id 
              ORDER BY cnt DESC 
              LIMIT 1)
    OR cnt IN (SELECT cnt
               FROM (SELECT H.hacker_id, H.name, COUNT(challenge_id) AS cnt
                     FROM Hackers H
                         INNER JOIN Challenges C ON C.hacker_id = H.hacker_id
                     GROUP BY H.hacker_id, H.name) Temp
               GROUP BY cnt
               HAVING COUNT(cnt) = 1)
ORDER BY cnt DESC, H.hacker_id;



WITH counter AS (
    SELECT H.hacker_id, H.name, COUNT(*) AS cnt
    FROM Challenges C
         JOIN Hackers H ON C.hacker_id = H.hacker_id
    GROUP BY H.hacker_id, H.name
)

SELECT counter.hacker_id, counter.name, counter.cnt
FROM counter
WHERE counter.cnt = (SELECT MAX(cnt) FROM counter)
    OR counter.cnt IN (SELECT cnt
                       FROM counter
                       GROUP BY cnt
                       HAVING COUNT(cnt) = 1)
ORDER BY counter.cnt DESC, counter.hacker_id