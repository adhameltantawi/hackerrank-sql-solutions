-- hackerrank.com/challenges/weather-observation-station-7
SELECT DISTINCT CITY 
FROM STATION
WHERE RIGHT(CITY, 1) IN  ('a', 'e', 'i', 'o', 'u')
