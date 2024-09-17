create database lab1;
create table IF NOT EXISTS users
 (
     id SERIAL,
     firstname varchar(50),
     lastname varchar(50)
 );

ALTER TABLE users
    ADD COLUMN isadmin int default '1';

ALTER TABLE users
    ALTER COLUMN isadmin DROP DEFAULT;

ALTER TABLE users
    ALTER COLUMN isadmin SET DATA TYPE boolean USING isadmin::boolean;

ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users
    ADD CONSTRAINT users_key PRIMARY KEY (id);



create table IF NOT EXISTS tasks
(
    id SERIAL PRIMARY KEY,
    name varchar(50),
    user_id int
);

DROP TABLE tasks;

DROP DATABASE lab1;






