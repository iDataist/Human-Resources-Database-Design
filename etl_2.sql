ALTER TABLE
  employee
ADD
  CONSTRAINT pk_employee PRIMARY KEY (id);

ALTER TABLE
  education
ADD
  CONSTRAINT pk_education PRIMARY KEY (education_id);

ALTER TABLE
  job
ADD
  CONSTRAINT pk_job PRIMARY KEY (job_id);

ALTER TABLE
  department
ADD
  CONSTRAINT pk_department PRIMARY KEY (department_id);

ALTER TABLE
  location
ADD
  CONSTRAINT pk_location PRIMARY KEY (location_id);

ALTER TABLE
  address
ADD
  CONSTRAINT pk_address PRIMARY KEY (address_id);

ALTER TABLE
  salary
ADD
  CONSTRAINT pk_salary PRIMARY KEY (salary_id);

ALTER TABLE
  employee_history
ADD
  CONSTRAINT pk_employee_history PRIMARY KEY (
    id, job_id, department_id
  )

ALTER TABLE
  address
ADD
  CONSTRAINT fk_address_location_id FOREIGN KEY(location_id) REFERENCES location (location_id);

ALTER TABLE
  employee_history
ADD
  CONSTRAINT fk_employee_history_employee_id FOREIGN KEY(id) REFERENCES employee (id);

ALTER TABLE
  employee_history
ADD
  CONSTRAINT fk_employee_history_manager_id FOREIGN KEY(manager_id) REFERENCES employee (id);

ALTER TABLE
  employee_history
ADD
  CONSTRAINT fk_employee_history_education_id FOREIGN KEY(education_id) REFERENCES education (education_id);

ALTER TABLE
  employee_history
ADD
  CONSTRAINT fk_employee_history_job_id FOREIGN KEY(job_id) REFERENCES job (job_id);

ALTER TABLE
  employee_history
ADD
  CONSTRAINT fk_employee_history_department_id FOREIGN KEY(department_id) REFERENCES department (department_id);

ALTER TABLE
  employee_history
ADD
  CONSTRAINT fk_employee_history_address_id FOREIGN KEY(address_id) REFERENCES address (address_id);

ALTER TABLE
  employee_history
ADD
  CONSTRAINT fk_employee_history_salary_id FOREIGN KEY(salary_id) REFERENCES salary (salary_id);

