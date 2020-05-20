SELECT CASE WHEN g.grade > 7 THEN s.name ELSE NULL END AS name
     , g.grade
     , s.marks     
FROM Students s
    JOIN Grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY g.grade DESC, name, s.marks
