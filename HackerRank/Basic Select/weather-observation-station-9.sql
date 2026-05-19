-- hackerrank.com/challenges/weather-observation-station-9
SELECT DISTINCT CITY 
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a','e','o','i','u')
