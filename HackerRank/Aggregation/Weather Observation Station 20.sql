SELECT ROUND(LAT_N, 4) 
FROM STATION S
WHERE (SELECT COUNT(*) FROM STATION WHERE S.LAT_N > LAT_N)
    = (SELECT COUNT(*) FROM STATION WHERE LAT_N > S.LAT_N)
    
    
SET @num = 0;
SELECT ROUND(LAT_N,4)
FROM (
    SELECT @num := @num + 1 AS MID, LAT_N
    FROM STATION
    ORDER BY LAT_N
) AS S
WHERE MID = (SELECT FLOOR((COUNT(*) + 1)/2) FROM STATION)