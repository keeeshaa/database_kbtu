--1.
CREATE OR REPLACE FUNCTION increase_value(val integer) RETURNS integer AS $$
BEGIN 
RETURN val + 10;
END; $$
LANGUAGE PLPGSQL;

--2.
CREATE OR REPLACE FUNCTION compare_numbers(
    a NUMERIC,
    b NUMERIC,
    OUT greater NUMERIC,
    OUT equal BOOLEAN,
    OUT lesser NUMERIC
)
AS $$
BEGIN
    greater := GREATEST(a,b);
    equal := (a=b);
    lesser := LEAST(a,b);
END;$$
LANGUAGE PLPGSQL;

--3.
CREATE OR REPLACE FUNCTION number_series(n INTEGER) RETURNS INTEGER AS $$
DECLARE 
    i INTEGER :=1;
BEGIN
    IF n <= 0 THEN
        RAISE EXCEPTION 'Please type a positive integer.';
    END IF;

    WHILE i <= n LOOP
        RAISE NOTICE '%',i;
        i := i + 1;
    END LOOP;
END;
$$
LANGUAGE PLPGSQL;

--4.
CREATE OR REPLACE FUNCTION find_employee(emp_fname VARCHAR) AS $$
DECLARE
    emp_id INT,
    emp_fname VARCHAR,
    emp_lname VARCHAR,
    emp_salary INT,
    emp_department INT
BEGIN
    SELECT employee_id, first_name, last_name, salary, department_id
    INTO emp_id, emp_fname, emp_lname, emp_salary, emp_department
    FROM employees 
    WHERE emp_fname = first_name;

    RAISE NOTICE 'Details: id = %, first name = %, last name = %, salary = %, department = %', emp_id, emp_fname, emp_lname, emp_salary, emp_department;
END;
$$
LANGUAGE PLPGSQL;

--5.
CREATE OR REPLACE FUNCTION list_products(category_name VARCHAR) 
RETURNS TABLE(id INT, name VARCHAR, price NUMERIC, stock INTEGER, category VARCHAR)
AS $$
BEGIN
    SELECT id, name, price, stock, category
    FROM products 
    WHERE category = category_name;
END;
$$
LANGUAGE PLPGSQL;

--6.
CREATE OR REPLACE FUNCTION find_radius(diameter INTEGER)
RETURNS INTEGER
AS $$
BEGIN
    RETURN diameter/2;
END;
$$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION find_circle_area(diameter INTEGER)
RETURNS INTEGER
AS $$
DECLARE 
    radius INTEGER;
BEGIN
    radius := find_radius(diameter);

    RETURN PI() * radius * radius;
END;
$$
LANGUAGE PLPGSQL;

--7.
CREATE OR REPLACE FUNCTION calculation(
    input_number INTEGER,
    input_text VARCHAR,
)RETURNS VARCHAR
AS $$
DECLARE
    doubled_number INTEGER; 
    upper_text VARCHAR;     
BEGIN
    num_calc: BEGIN
        doubled_number := input_number * 2;
        RAISE NOTICE 'Doubled Number: %', doubled_number;
    END num_calc;

    text_upper: BEGIN
        upper_text := UPPER(input_text);
        RAISE NOTICE 'Uppercase Text: %', upper_text;
    END text_upper;
END;
$$
LANGUAGE PLPGSQL;

