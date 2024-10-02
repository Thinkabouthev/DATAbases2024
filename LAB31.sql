CREATE DATABASE lab3;

SELECT lastname FROM employees;

SELECT DISTINCT lastname FROM employees;

SELECT * FROM employees WHERE lastname = 'Smith';

SELECT * FROM employees WHERE lastname = 'Smith' OR lastname = 'Doe';

SELECT * FROM employees WHERE department = 14;

SELECT * FROM employees WHERE department = 37 OR  department = 77;

SELECT SUM(budget) FROM departments;

SELECT department, COUNT(*) as num_employees FROM employees GROUP BY department;

SELECT department FROM employees GROUP BY department HAVING COUNT(*) > 2;

SELECT name FROM departments ORDER BY budget DESC LIMIT 1 OFFSET 1;

SELECT employees.name, employees.lastname
FROM employees
JOIN departments ON employees.department = departments.code
WHERE departments.budget = (SELECT MIN(budget) FROM departments);

SELECT name, lastname FROM employees WHERE city = 'Almaty'
UNION
SELECT name, lastname FROM customers WHERE city = 'Almaty';

SELECT * FROM departments WHERE budget > 60000 ORDER BY budget ASC, code DESC;

UPDATE departments
SET budget = budget * 0.9
WHERE budget = (SELECT MIN(budget) FROM departments);

UPDATE employees
SET department = (SELECT code FROM departments WHERE name = 'IT')
WHERE department = (SELECT code FROM departments WHERE name = 'Research');

DELETE FROM employees WHERE department = (SELECT code FROM departments WHERE name = 'IT');

DELETE FROM employees;
