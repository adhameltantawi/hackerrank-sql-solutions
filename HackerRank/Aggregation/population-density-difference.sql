-- https://www.hackerrank.com/challenges/population-density-difference/problem

SELECT MAX(POPULATION) - MIN(POPULATION) AS diff
FROM CITY