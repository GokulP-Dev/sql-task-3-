-- Create Database
CREATE DATABASE CRT_Orders;

-- Use Database
USE CRT_Orders;

---------------------------------------------------
-- Create Orders Table
---------------------------------------------------

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    event_name VARCHAR(50),
    event_date DATE
);

---------------------------------------------------
-- 1. Insert 5 Orders with Different Values
---------------------------------------------------

INSERT INTO Orders VALUES
(1, 'Apple', 5, 250, 'Tech Expo', '2026-05-10'),
(2, 'Android Phone', 2, 450, 'Mobile Launch', '2026-06-15'),
(3, 'AirPods', 4, 300, 'Music Fest', '2026-07-20'),
(4, 'Laptop', 1, 800, 'College Day', '2026-08-25'),
(5, 'Adapter', 3, 150, 'Workshop', '2026-09-05');

---------------------------------------------------
-- Display All Orders
---------------------------------------------------

SELECT * FROM Orders;

---------------------------------------------------
-- 2. Select Orders where quantity > 2
---------------------------------------------------

SELECT *
FROM Orders
WHERE quantity > 2;

---------------------------------------------------
-- 3. Select Orders where price is between 100 and 500
---------------------------------------------------

SELECT *
FROM Orders
WHERE price BETWEEN 100 AND 500;

---------------------------------------------------
-- 4. Fetch Orders with product_name starting with 'A'
---------------------------------------------------

SELECT *
FROM Orders
WHERE product_name LIKE 'A%';

---------------------------------------------------
-- 5. Fetch Orders sorted by quantity descending
---------------------------------------------------

SELECT *
FROM Orders
ORDER BY quantity DESC;

---------------------------------------------------
-- 6. Use CONCAT() to combine event_name and event_date
---------------------------------------------------

SELECT 
    CONCAT(event_name, ' - ', event_date) AS Event_Details
FROM Orders;