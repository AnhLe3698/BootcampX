const args = process.argv.slice(2);
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const query = {
  text: `
  SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
  FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name LIKE $1
  GROUP BY teachers.name, cohorts.name
  ORDER BY teacher;
  `,
  values: [`%${args[0] || 'JUL02'}%`]
};

pool.query(query).then(res => {
  res.rows.forEach(user => {
    console.log(`${user.teacher} had contributed ${user.total_assistances} for the ${user.cohort} cohort`);
  });
});
