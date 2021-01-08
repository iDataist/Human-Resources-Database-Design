select employee_name, job, department
from employee_history h
join department d
on h.department_id = d.department_id
join job j
on h.job_id = j.job_id
join employee  e
on h.id = e.id
order by employee_name