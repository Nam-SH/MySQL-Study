SELECT SUM(CITY.POPULATION)
FROM CITY 
LEFT JOIN COUNTRY ON CITY.CountryCode = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Asia';