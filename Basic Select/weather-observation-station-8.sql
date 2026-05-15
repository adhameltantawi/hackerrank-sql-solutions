-- hackerrank.com/challenges/weather-observation-station-8
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) IN ('a','e','o','i','u') AND RIGHT(CITY,1) IN ('a','e','o','i','u')
