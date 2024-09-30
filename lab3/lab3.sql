-- 1.
SELECT lastname FROM employees;

-- 2.
SELECT DISTINCT lastname FROM employees;

-- 3.
SELECT * FROM employees WHERE lastname = 'Smith';

-- 4.
SELECT * FROM employees WHERE lastname IN ('Smith', 'Doe');

-- 5.
SELECT * FROM employees WHERE department = 14;

-- 6.
SELECT * FROM employees WHERE department IN (37, 77);

-- 7.
SELECT SUM(budget) FROM departments;

-- 8.
SELECT department, COUNT(*) AS num_employees FROM employees GROUP BY department;

-- 9.
SELECT department FROM employees GROUP BY department HAVING COUNT(*) > 2;

-- 10.
SELECT name FROM departments ORDER BY budget DESC LIMIT 1 OFFSET 1;

-- 11.
SELECT e.name, e.lastname
FROM employees e
JOIN departments d ON e.department = d.code
WHERE d.budget = (SELECT MIN(budget) FROM departments);

-- 12.
SELECT name, lastname FROM employees WHERE city = 'Almaty'
UNION
SELECT name, lastname FROM customers WHERE city = 'Almaty';

-- 13.
SELECT * FROM departments WHERE budget > 60000 ORDER BY budget ASC, code DESC;

-- 14.
UPDATE departments
SET budget = budget * 0.9
WHERE budget = (SELECT MIN(budget) FROM departments);

-- 15.
UPDATE employees
SET department = 14
WHERE department = 77;

-- 16.
DELETE FROM employees WHERE department = 14;

-- 17.
DELETE FROM employees;
