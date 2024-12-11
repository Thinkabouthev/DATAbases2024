CREATE DATABASE labw10;

CREATE TABLE Books
(
    book_id INT PRIMARY KEY,
    title varchar(255),
    author varchar(255),
    price DECIMAl(5,2),
    quantity INT
);

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Customers
(
    customer_id INT PRIMARY KEY,
    name varchar(255),
    email varchar(255)
);

INSERT INTO Books(book_id,title, author, price, quantity) VALUES
(1, 'Database 101', 'A.Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3,'Advanced DB', 'C. Lee', 50.00, 5);


INSERT INTO Customers(customer_id, name, email) VALUES
(101, 'John Doe', ' johndoe@example.com'),
(102,'Jane Doe', ' janedoe@example.com');

--1
START TRANSACTION;
INSERT INTO Orders(order_id, book_id, customer_id, order_date, quantity)
VALUES (1, 1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;
COMMIT;

--2
DO $$
DECLARE
    available_quantity INTEGER;
BEGIN
    SELECT quantity INTO available_quantity FROM Books WHERE book_id = 3;
    IF available_quantity < 10 THEN
        RAISE NOTICE 'Not enough books';
        ROLLBACK;
    ELSE
        INSERT INTO Orders (book_id, customer_id, order_date, quantity)
        VALUES (3, 102, CURRENT_DATE, 10);
        UPDATE Books
        SET quantity = quantity - 10
        WHERE book_id = 3;
        COMMIT;
    END IF;
END $$;


--3

--session 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE Books
SET price = 150.00
WHERE title = 'Database 101';
COMMIT;
--session 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT price FROM BOOKS WHERE title = 'Database 101';
COMMIT;

SELECT price FROM Books WHERE title = 'Database 101';

--4
BEGIN;
UPDATE Customers
SET email = 'newemail@kbtu.kz'
WHERE customer_id = 102;
COMMIT;


