-- Get the total number of assistance_requests for a teacher
-- Select the teacher's name and the total assistance requests.
-- Since this query needs to work with any specific teacher name, 
-- use 'Waylon Boehm' for the teacher's name here.

SELECT COUNT(assistance_requests.id) AS total_assistances, a.name AS name
FROM assistance_requests
JOIN teachers a ON assistance_requests.teacher_id = a.id
WHERE a.name = 'Waylon Boehm'
GROUP BY a.name;

SELECT COUNT(assistance_requests.id) AS total_assistances, teachers.name AS name
FROM teachers 
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
GROUP BY teachers.name
HAVING teachers.name = 'Waylon Boehm';
