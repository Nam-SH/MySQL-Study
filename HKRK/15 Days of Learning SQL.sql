SELECT first.submission_date, first.hacker_cnt, second.hacker_id, h.name
FROM (
         SELECT submission_date, COUNT(distinct hacker_id) AS hacker_cnt
         FROM (SELECT s.*,
                      dense_rank() OVER (ORDER BY submission_date)                        AS date_rank,
                      dense_rank() OVER (PARTITION BY hacker_id ORDER BY submission_date) AS hacker_rank
               FROM submissions s) temp1
         WHERE date_rank = hacker_rank
         GROUP BY submission_date) first
         JOIN
     (
         SELECT submission_date,
                hacker_id,
                rank() OVER (PARTITION BY submission_date ORDER BY sub_cnt DESC, hacker_id) AS max_rank
         FROM (SELECT submission_date, hacker_id, COUNT(*) AS sub_cnt
               FROM submissions
               GROUP BY submission_date, hacker_id) temp2
     ) second
     ON first.submission_date = second.submission_date AND second.max_rank = 1
         JOIN hackers h ON h.hacker_id = second.hacker_id
ORDER BY first.submission_date;