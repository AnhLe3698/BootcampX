CREATE TABLE cohorts (
  id Serial Primary Key NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date date,
  end_date date
);

CREATE TABLE students (
  id Serial Primary Key NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  github VARCHAR(255),
  start_date date,
  end_date date,
  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
);

