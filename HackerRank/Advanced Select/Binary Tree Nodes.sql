SELECT N, CASE  
            WHEN P IS NULL THEN 'Root' 
            WHEN N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Inner' 
            ELSE 'Leaf'
          END
FROM BST
ORDER BY N


SELECT N, IF(P IS NULL,
             'Root',
             IF((SELECT COUNT(*) FROM BST WHERE P = B.N), 'Inner', 'Leaf')) 
FROM BST AS B 
ORDER BY N;