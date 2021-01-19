-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employee" (
    "id" INT   NOT NULL,
    "employee_id" INT   NOT NULL,
    "employee_name" VARCHAR(50)   NOT NULL,
    "employee_email" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "education" (
    "education_id" INT   NOT NULL,
    "education_level" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_education" PRIMARY KEY (
        "education_id"
     )
);

CREATE TABLE "job" (
    "job_id" INT   NOT NULL,
    "job_title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_job" PRIMARY KEY (
        "job_id"
     )
);

CREATE TABLE "department" (
    "department_id" INT   NOT NULL,
    "department_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "location" (
    "location_id" INT   NOT NULL,
    "location_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_location" PRIMARY KEY (
        "location_id"
     )
);

CREATE TABLE "address" (
    "address_id" INT   NOT NULL,
    "address" VARCHAR(50)   NOT NULL,
    "city_id" INT   NOT NULL,
    "location_id" INT   NOT NULL,
    CONSTRAINT "pk_address" PRIMARY KEY (
        "address_id"
     )
);

CREATE TABLE "city" (
    "city_id" INT   NOT NULL,
    "city" VARCHAR(50)   NOT NULL,
    "state" CHAR(2)   NOT NULL,
    CONSTRAINT "pk_city" PRIMARY KEY (
        "city_id"
     )
);

CREATE TABLE "salary" (
    "salary_id" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "salary_id"
     )
);

CREATE TABLE "employee_history" (
    "id" INT   NOT NULL,
    "manager_id" INT   NOT NULL,
    "education_id" INT   NOT NULL,
    "job_id" INT   NOT NULL,
    "department_id" INT   NOT NULL,
    "address_id" INT   NOT NULL,
    "salary_id" INT   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    CONSTRAINT "pk_employee_history" PRIMARY KEY (
        "id","job_id","department_id"
     )
);

ALTER TABLE "address" ADD CONSTRAINT "fk_address_city_id" FOREIGN KEY("city_id")
REFERENCES "city" ("city_id");

ALTER TABLE "address" ADD CONSTRAINT "fk_address_location_id" FOREIGN KEY("location_id")
REFERENCES "location" ("location_id");

ALTER TABLE "employee_history" ADD CONSTRAINT "fk_employee_history_id" FOREIGN KEY("id")
REFERENCES "employee" ("id");

ALTER TABLE "employee_history" ADD CONSTRAINT "fk_employee_history_manager_id" FOREIGN KEY("manager_id")
REFERENCES "employee" ("id");

ALTER TABLE "employee_history" ADD CONSTRAINT "fk_employee_history_education_id" FOREIGN KEY("education_id")
REFERENCES "education" ("education_id");

ALTER TABLE "employee_history" ADD CONSTRAINT "fk_employee_history_job_id" FOREIGN KEY("job_id")
REFERENCES "job" ("job_id");

ALTER TABLE "employee_history" ADD CONSTRAINT "fk_employee_history_department_id" FOREIGN KEY("department_id")
REFERENCES "department" ("department_id");

ALTER TABLE "employee_history" ADD CONSTRAINT "fk_employee_history_address_id" FOREIGN KEY("address_id")
REFERENCES "address" ("address_id");

ALTER TABLE "employee_history" ADD CONSTRAINT "fk_employee_history_salary_id" FOREIGN KEY("salary_id")
REFERENCES "salary" ("salary_id");

