-- hackerrank.com/challenges/weather-observation-station-6
SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTRING(CITY, 1, 1) IN ('a','e','o','i','u') 
