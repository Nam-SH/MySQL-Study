WITH Recursive_CTE AS (
    SELECT 20 AS counter
    UNION ALL 
    SELECT counter - 1
    FROM Recursive_CTE
    WHERE counter > 0
)
SELECT REPLICATE('* ', counter)
FROM Recursive_CTE


DECLARE @Num INT = 20
WHILE(@Num > 0)
    BEGIN
       PRINT REPLICATE('* ', @Num);
       SET @Num -= 1;
    END