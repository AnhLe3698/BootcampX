const args = process.argv.slice(2);
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

console.log(args);

pool.query(`
SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${args[0] || 'JUL02'}% '
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;
`).then(res => {
  res.rows.forEach(user => {
    console.log(`${user.teacher} had contributed ${user.total_assistances} for the ${user.cohort} cohort`);
  });
});
