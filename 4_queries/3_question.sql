-- Get important data about each assistance request.
-- Select the teacher's name, student's name, assignment's name, 
-- and the duration of each assistance request.
-- Subtract completed_at by started_at to find the duration.
-- Order by the duration of the request.

SELECT teachers.name AS teacher, students.name AS student, 
assignments.name AS assignment, 
(assistance_requests.completed_at - assistance_requests.started_at) AS duration
FROM assistance_requests
JOIN students ON assistance_requests.student_id = students.id
JOIN assignments ON assistance_requests.assignment_id = assignments.id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
ORDER BY (assistance_requests.completed_at - assistance_requests.started_at);