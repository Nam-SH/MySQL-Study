DECLARE @Num INT = 1;
WHILE @Num <= 20
    BEGIN
        PRINT REPLICATE('* ', @Num);
        SET @Num += 1;
    END
    
    
WITH cte AS (
    SELECT 1 Num
    UNION ALL
    SELECT Num + 1 Num 
    FROM cte
    WHERE Num < 20
)
SELECT REPLICATE('* ', Num) FROM cte