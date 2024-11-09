--1.
CREATE INDEX  countries_name_index ON countries(name);

--2.
CREATE INDEX employees_ns_index ON employees(name, surname);

--3.
CREATE UNIQUE INDEX employees_salary_index ON employees(salary);

--4.
CREATE INDEX employees_name_subs_index ON employees((substring(name from 1 to 4)));

--5.
CREATE INDEX emp_department_id_index ON employees(department_id);
CREATE INDEX dep_department_id_index ON departments(department_id);
CREATE INDEX dep_budget_index ON departments(budget);
CREATE INDEX emp_salary_index ON employees(salary);