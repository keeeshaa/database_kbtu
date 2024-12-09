-- 1.
BEGIN TRANSACTION;

INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (1, 1, 101, CURRENT_DATE, 2);
UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;
COMMIT;

-- 2.
BEGIN;
SAVEPOINT check_stock;
UPDATE Books
SET quantity = quantity - 10
WHERE book_id = 3 AND quantity >= 10;
ROLLBACK TO SAVEPOINT check_stock;
COMMIT;


-- 3.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;
UPDATE Books
SET price = 45.00
WHERE book_id = 1;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;
SELECT price FROM Books WHERE book_id = 1;
COMMIT;

-- 4.
BEGIN TRANSACTION;
UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 101;

COMMIT;
SELECT * FROM Customers WHERE customer_id = 101;
