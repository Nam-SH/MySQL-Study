SELECT DISTINCT CITY
FROM station
WHERE CITY NOT LIKE '%a'
AND CITY NOT LIKE '%e'
AND CITY NOT LIKE '%i'
AND CITY NOT LIKE '%o'
AND CITY NOT LIKE '%u'


SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP "[aeiou]$"