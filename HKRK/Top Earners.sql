SELECT months * salary AS earnings, COUNT(*)
FROM Employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;


SELECT months * salary, COUNT(*)
FROM Employee
WHERE months * salary = (SELECT MAX(months*salary) FROM Employee)
GROUP BY months * salary


SELECT months * salary AS P, COUNT(*)
FROM Employee
GROUP BY months * salary
HAVING P = (SELECT MAX(months*salary) FROM Employee)
