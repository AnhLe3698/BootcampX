name, email, id, and cohort_id.

SELECT name, id, email, cohort_id
FROM students
WHERE email NOT IN ('%gmail.com%') AND phone IS NULL;