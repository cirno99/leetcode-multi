# Write your MySQL query statement below
WITH
    T AS (
        SELECT
            *,
            row_number() OVER (
                PARTITION BY continent
                ORDER BY name
            ) AS rk
        FROM Student
    )
SELECT
    max(if(continent = 'America', name, NULL)) AS 'America',
    max(if(continent = 'Asia', name, NULL)) AS 'Asia',
    max(if(continent = 'Europe', name, NULL)) AS 'Europe'
FROM T
GROUP BY rk;
