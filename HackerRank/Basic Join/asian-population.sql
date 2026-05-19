-- https://www.hackerrank.com/challenges/asian-population/problem

SELECT SUM(CI.POPULATION) AS total_of_population
FROM COUNTRY AS CO
INNER JOIN CITY AS CI
ON CI.CountryCode = CO.Code
WHERE CO.CONTINENT = 'Asia'
