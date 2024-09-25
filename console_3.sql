Drop table countries;
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY ,
    country_name VARCHAR(255),
    region_id INT,
    population INT
);

INSERT INTO countries (country_name, region_id, population)
VALUES ('Country1', 1, 500000);

INSERT INTO countries (country_id, country_name)
VALUES (2, 'Country2');

INSERT INTO countries (country_name, region_id, population)
VALUES ('Country3', NULL, 30000);

INSERT INTO countries (country_name, region_id, population)
VALUES
('Country4', 1, 100000),
('Country5', 3, 400000),
('Country6', 4, 250000);

ALTER TABLE countries ALTER country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (region_id, population)
VALUES (2, 1000000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new
(
    LIKE countries);
INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

SELECT country_name, population * 1.1 AS "New Population"
FROM countries;

DELETE FROM countries
WHERE population < 100000;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries RETURNING *;