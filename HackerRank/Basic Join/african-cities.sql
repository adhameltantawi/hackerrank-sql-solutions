-- https://www.hackerrank.com/challenges/african-cities/

SELECT CI.NAME
FROM COUNTRY AS CO
INNER JOIN CITY AS CI
ON CO.Code = CI.CountryCode
WHERE CO.CONTINENT = 'Africa'