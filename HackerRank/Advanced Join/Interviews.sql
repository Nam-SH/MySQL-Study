SELECT cont.*, SUM(f1.s1) AS c1, SUM(f1.s2) AS c2, SUM(f1.s3) AS c3, SUM(f1.s4) AS c4
FROM Contests cont
    INNER JOIN colleges col ON col.contest_id = cont.contest_id
    INNER JOIN (SELECT C.college_id
                , SUM(V1.sum_total_submissions) AS s1
                , SUM(V1.sum_total_accepted_submissions) AS s2
                , SUM(V2.sum_views) AS s3
                , SUM(V2.sum_unique_views) AS s4
                FROM Challenges c
                    LEFT JOIN (SELECT challenge_id
                                , SUM(total_submissions) AS sum_total_submissions
                                , SUM(total_accepted_submissions) AS sum_total_accepted_submissions
                                FROM Submission_Stats s
                                GROUP BY challenge_id) v1
                          ON v1.challenge_id = c.challenge_id
                    LEFT JOIN (SELECT challenge_id
                                , SUM(total_views) AS sum_views
                                , SUM(total_unique_views) AS sum_unique_views
                                FROM View_Stats v 
                                GROUP BY challenge_id) v2
                          ON v2.challenge_id = c.challenge_id
                GROUP BY c.college_id) f1 
            ON f1.college_id = col.college_id
GROUP BY cont.contest_id, cont.hacker_id, cont.name
HAVING c1 + c2 + c3 + c4 <> 0
ORDER BY cont.contest_id