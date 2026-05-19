-- hackerrank.com/challenges/what-type-of-triangle
SELECT 
    CASE
        WHEN A + B <= C 
        OR A + C <= B
        OR B + C <= A
        THEN 'Not A Triangle'
        WHEN A = B AND A = C
        THEN 'Equilateral'
        WHEN (A = B AND A != C) OR (A = C AND A != B)
        THEN 'Isosceles'
        WHEN A != B AND B !=C AND A != C
        THEN 'Scalene'
        END
FROM TRIANGLES
