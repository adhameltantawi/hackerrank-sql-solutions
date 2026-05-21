-- https://leetcode.com/problems/rising-temperature/

SELECT W1.id
FROM Weather AS W1
LEFT JOIN Weather AS W2
ON W1.recordDate = DATE_ADD(W2.recordDate, INTERVAL  1 DAY)
WHERE W1.temperature > W2.temperature