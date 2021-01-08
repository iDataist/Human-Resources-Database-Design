-- Query 1: Return a list of employees with Job Titles and Department Name
SELECT
  employee_name,
  job,
  department
FROM
  employee_history h
  JOIN department d ON h.department_id = d.department_id
  JOIN job j ON h.job_id = j.job_id
  JOIN employee e ON h.id = e.id
ORDER BY
  employee_name;

-- Query 2: Insert Web Programmer as a new job title
INSERT INTO job (job_id, job)
VALUES
  (10, 'Web Programmer');

SELECT
  *
FROM
  job;

-- Query 3: Correct the job title from web programmer to web developer
UPDATE
  job
SET
  job = 'Web Developer'
WHERE
  job_id = 10;

SELECT
  *
FROM
  job;

-- Query 4: Delete the job title Web Developer from the database
DELETE FROM
  job
WHERE
  job_id = 10;
SELECT
  *
FROM
  job;

-- Query 5: How many employees are in each department?
SELECT
  department,
  COUNT(DISTINCT id) as employee_count
FROM
  employee_history h
  JOIN department d ON h.department_id = d.department_id
WHERE
  end_date IS NULL
GROUP BY
  department
ORDER BY
  employee_count DESC;

-- Query 6: Returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.
SELECT
  e1.employee_name,
  j.job,
  d.department,
  e2.employee_name as manager_name,
  h.start_date,
  h.end_date
FROM
  employee_history h
  JOIN department d ON h.department_id = d.department_id
  JOIN job j ON h.job_id = j.job_id
  JOIN employee e1 ON h.id = e1.id
  JOIN employee e2 ON h.manager_id = e2.id
WHERE
  e1.employee_name = 'Toni Lembeck';

-- Additional Feature 1: Create a view that returns all employee attributes
CREATE VIEW address_location AS
SELECT
  a.address_id,
  a.address,
  a.city,
  a.state,
  l.location

FROM
  address a
  JOIN location l ON a.location_id = l.location_id;

CREATE VIEW all_attributes AS
SELECT
  e1.employee_id,
  e1.employee_name,
  h.start_date,
  h.end_date,
  ed.education,
  j.job,
  d.department,
  e2.employee_name as manager_name,
  s.salary,
  a.address,
  a.city,
  a.state,
  a.location
FROM
  employee_history h
  JOIN department d ON h.department_id = d.department_id
  JOIN job j ON h.job_id = j.job_id
  JOIN employee e1 ON h.id = e1.id
  JOIN employee e2 ON h.manager_id = e2.id
  JOIN education ed ON h.education_id = ed.education_id
  JOIN address_location a ON h.address_id = a.address_id
  JOIN salary s ON h.salary_id = s.salary_id;

SELECT
  *
FROM
  all_attributes;