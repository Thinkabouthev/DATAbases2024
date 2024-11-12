CREATE DATABASE lab7;

CREATE TABLE countries (
    name VARCHAR(255)
);
INSERT INTO countries (name) VALUES
('Kazakhstan'),
('United States'),
('Germany'),
('France'),
('Japan'),
('Canada');

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    budget INT
);
INSERT INTO departments (department_id, name, budget) VALUES
(1, 'Engineering', 50000),
(2, 'Marketing', 30000),
(3, 'Sales', 45000),
(4, 'Human Resources', 20000),
(5, 'Finance', 60000),
(6, 'IT', 75000);


CREATE TABLE employees (
    name VARCHAR(255),
    surname VARCHAR(255),
    salary INT,
    department_id INT REFERENCES departments
);
INSERT INTO employees (name, surname, salary, department_id) VALUES
('John', 'Doe', 45000, 1),
('Jane', 'Smith', 55000, 2),
('Emily', 'Jones', 60000, 3),
('Michael', 'Brown', 70000, 4),
('David', 'Wilson', 50000, 5),
('Sophia', 'Garcia', 80000, 6);


--1
CREATE INDEX ind_country_name ON countries(name);

--2
CREATE INDEX ind_employees_name_surname ON employees(name,surname);

--3
CREATE UNIQUE INDEX ind_employees_salary  ON employees(salary);

--4
CREATE INDEX ind_employees ON employees(substring(name from 1 for 4));

--5
CREATE INDEX ind_employees_department_salary ON employees(department_id, salary);
CREATE INDEX ind_dep_budget on departments(budget);

