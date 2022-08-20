-- Solution 1
SELECT b.day AS day, b.total_assignments AS total_assignments FROM
(SELECT day, count(*) AS total_assignments
FROM assignments
GROUP BY day
ORDER BY DAY) b
WHERE b.total_assignments >= 10;

-- Solution 2
SELECT day, count(*) AS total_assignments
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY DAY
