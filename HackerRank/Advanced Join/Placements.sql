SELECT S1.Name
FROM Friends F
    INNER JOIN Students S1 ON F.ID = S1.ID
    INNER JOIN Packages P1 ON F.ID = P1.ID
    INNER JOIN Packages P2 ON F.Friend_ID = P2.ID
WHERE P1.Salary < P2.Salary
ORDER BY P2.Salary