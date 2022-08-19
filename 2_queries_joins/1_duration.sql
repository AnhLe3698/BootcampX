SELECT SUM(a.duration) AS total_duration
FROM assignment_submissions a
JOIN students b
ON a.student_id = b.id
WHERE b.name = 'Ibrahim Schimmel';