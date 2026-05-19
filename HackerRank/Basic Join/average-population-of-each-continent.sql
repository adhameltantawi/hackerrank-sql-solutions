-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

SELECT 
    CO.NAME
    CAST(AVG(CI.Population) AS SIGNED)
FROM COUNTRY AS CO
INNER JOIN CITY AS CI
ON CI.CountryCode = CO.Code
