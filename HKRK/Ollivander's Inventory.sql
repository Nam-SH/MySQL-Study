SELECT w.id, wp.age, w.coins_needed, w.power 
FROM Wands AS w
    JOIN Wands_Property wp ON w.code = wp.code
WHERE wp.is_evil = 0 
    AND w.coins_needed = (SELECT MIN(coins_needed)
                          FROM Wands ww
                              JOIN Wands_Property wwp ON ww.code = wwp.code
                          WHERE ww.power = w.power AND wwp.age = wp.age
                         )
ORDER BY w.power DESC, wp.age DESC;