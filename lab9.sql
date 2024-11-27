CREATE DATABASE lab9;

--1
CREATE OR REPLACE FUNCTION increase_value(a integer)
RETURNS INTEGER AS $$
BEGIN
    RETURN a + 10;
END;
$$ LANGUAGE plpgsql;
SELECT increase_value(5);

--2
CREATE OR REPLACE FUNCTION compare_numbers(num1 INTEGER, num2 INTEGER)
RETURNS TEXT AS $$
    BEGIN
        IF num1 > num2 THEN
            RETURN 'Greater';
        ELSEIF num1 = num2 THEN
            RETURN 'Equal';
        ELSE
            RETURN 'Lesser';
        END IF;
    END;
$$ LANGUAGE plpgsql;
SELECT compare_numbers(10,20);

--3
CREATE OR REPLACE FUNCTION number_series(n INT)
RETURNS TEXT AS $$
DECLARE
    result TEXT := '';
BEGIN
    FOR i IN 1..n LOOP
        result := result || i || CASE WHEN i < n THEN ', ' ELSE '' END;
    END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT number_series(6);

--4
CREATE OR REPLACE FUNCTION find_employee(emp_name VARCHAR)
RETURNS TABLE(id INTEGER, name VARCHAR, salary NUMERIC) AS $$
    BEGIN
        RETURN QUERY
        SELECT id, name, salary FROM employees WHERE name = emp_name;
    END;
    $$ LANGUAGE plpgsql;


--5
CREATE OR REPLACE FUNCTION list_products(prod_category varchar)
    RETURNS TABLE(id integer, category varchar, name varchar, price numeric) AS $$
BEGIN
    RETURN QUERY
    SELECT id, category, name, price FROM products WHERE category=prod_category;
END;
$$ LANGUAGE plpgsql;


--6
CREATE OR REPLACE FUNCTION calculate_bonus(emp_id INT)
    RETURNS NUMERIC AS $$
DECLARE
    bonus_amount NUMERIC;
BEGIN
    SELECT salary * 0.1 INTO bonus_amount FROM employees WHERE id = emp_id;
    RETURN bonus_amount;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(emp_id INT)
    RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(emp_id);
    UPDATE employees SET salary = salary + bonus WHERE id = emp_id;
END;
$$ LANGUAGE plpgsql;



--7 
CREATE OR REPLACE FUNCTION complex_calculation(num_param INT, str_param VARCHAR)
    RETURNS TEXT AS $$
DECLARE
    numeric_result INT;
    string_result VARCHAR;
BEGIN
    numeric_result := num_param * 10;

    string_result := str_param || '_processed';

    RETURN 'Number: ' || numeric_result || ', String: ' || string_result;
END;
$$ LANGUAGE plpgsql;