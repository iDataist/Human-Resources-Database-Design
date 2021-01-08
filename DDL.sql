CREATE TABLE "Employee" (
    "Employee_ID" SERIAL   NOT NULL,
    "Employee_Name" VARCHAR(50)   NOT NULL,
    "Employee_Email" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "Employee_ID"
     )
);

CREATE TABLE "Education" (
    "Education_ID" SERIAL   NOT NULL,
    "Education_Level" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Education" PRIMARY KEY (
        "Education_ID"
     )
);

CREATE TABLE "Job" (
    "Job_ID" SERIAL   NOT NULL,
    "Job_Title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Job" PRIMARY KEY (
        "Job_ID"
     )
);

CREATE TABLE "Department" (
    "Department_ID" SERIAL   NOT NULL,
    "Department_Name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "Department_ID"
     )
);

CREATE TABLE "Location" (
    "Location_ID" SERIAL   NOT NULL,
    "Location_Name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Location" PRIMARY KEY (
        "Location_ID"
     )
);

CREATE TABLE "Address" (
    "Address_ID" SERIAL   NOT NULL,
    "Address" VARCHAR(50)   NOT NULL,
    "City" VARCHAR(50)   NOT NULL,
    "State" CHAR(2)   NOT NULL,
    "Location_ID" INT   NOT NULL,
    CONSTRAINT "pk_Address" PRIMARY KEY (
        "Address_ID"
     )
);

CREATE TABLE "Salary" (
    "Salary_ID" SERIAL   NOT NULL,
    "Salary" NUMERIC   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "Salary_ID"
     )
);

CREATE TABLE "Employee_History" (
    "Employee_ID" INT   NOT NULL,
    "Manager_ID" INT   NOT NULL,
    "Education_ID" INT   NOT NULL,
    "Job_ID" INT   NOT NULL,
    "Department_ID" INT   NOT NULL,
    "Address_ID" INT   NOT NULL,
    "Salary_ID" INT   NOT NULL,
    "Hire_Date" DATE   NOT NULL,
    "Start_Date" DATE   NOT NULL,
    "End_Date" DATE   NOT NULL,
    CONSTRAINT "pk_Employee_History" PRIMARY KEY (
        "Employee_ID","Job_ID","Department_ID"
     )
);

ALTER TABLE "Address" ADD CONSTRAINT "fk_Address_Location_ID" FOREIGN KEY("Location_ID")
REFERENCES "Location" ("Location_ID");

ALTER TABLE "Employee_History" ADD CONSTRAINT "fk_Employee_History_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employee" ("Employee_ID");

ALTER TABLE "Employee_History" ADD CONSTRAINT "fk_Employee_History_Manager_ID" FOREIGN KEY("Manager_ID")
REFERENCES "Employee" ("Employee_ID");

ALTER TABLE "Employee_History" ADD CONSTRAINT "fk_Employee_History_Education_ID" FOREIGN KEY("Education_ID")
REFERENCES "Education" ("Education_ID");

ALTER TABLE "Employee_History" ADD CONSTRAINT "fk_Employee_History_Job_ID" FOREIGN KEY("Job_ID")
REFERENCES "Job" ("Job_ID");

ALTER TABLE "Employee_History" ADD CONSTRAINT "fk_Employee_History_Department_ID" FOREIGN KEY("Department_ID")
REFERENCES "Department" ("Department_ID");

ALTER TABLE "Employee_History" ADD CONSTRAINT "fk_Employee_History_Address_ID" FOREIGN KEY("Address_ID")
REFERENCES "Address" ("Address_ID");

ALTER TABLE "Employee_History" ADD CONSTRAINT "fk_Employee_History_Salary_ID" FOREIGN KEY("Salary_ID")
REFERENCES "Salary" ("Salary_ID");

