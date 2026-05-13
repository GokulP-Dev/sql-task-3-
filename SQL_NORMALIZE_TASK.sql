-- Create Database
CREATE DATABASE CRT_SQL;

-- Use Database
USE CRT_SQL;

---------------------------------------------------
-- 1. Normalize a table with repeating groups into 2NF
---------------------------------------------------

-- Unnormalized Table
CREATE TABLE Order_Data (
    order_id INT,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO Order_Data VALUES
(1, 'Pavithra', 'Laptop', 1, 50000),
(1, 'Pavithra', 'Mouse', 2, 500),
(2, 'Arun', 'Keyboard', 1, 1500),
(2, 'Arun', 'Monitor', 1, 12000);

---------------------------------------------------
-- Convert into 2NF
---------------------------------------------------

-- Customer Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY(order_id, product_name),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

-- Insert Data
INSERT INTO Customers VALUES
(101, 'Pavithra'),
(102, 'Arun');

INSERT INTO Orders VALUES
(1, 101, 'Laptop', 1, 50000),
(1, 101, 'Mouse', 2, 500),
(2, 102, 'Keyboard', 1, 1500),
(2, 102, 'Monitor', 1, 12000);

---------------------------------------------------
-- 2. Example of 3NF
---------------------------------------------------

-- Product Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

-- Order Details Table
CREATE TABLE Order_Details (
    order_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2),
    PRIMARY KEY(order_id, product_id),
    FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

-- Insert Product Data
INSERT INTO Products VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mouse', 'Accessories'),
(203, 'Keyboard', 'Accessories'),
(204, 'Monitor', 'Electronics');

-- Insert Order Details
INSERT INTO Order_Details VALUES
(1, 201, 1, 50000),
(1, 202, 2, 1000),
(2, 203, 1, 1500),
(2, 204, 1, 12000);

---------------------------------------------------
-- 3. Find AVG() Order Price
---------------------------------------------------

SELECT AVG(total_price) AS Average_Order_Price
FROM Order_Details;

---------------------------------------------------
-- 4. Group orders by product_name
-- Show total sales
---------------------------------------------------

SELECT 
    p.product_name,
    SUM(o.total_price) AS Total_Sales
FROM Order_Details o
JOIN Products p
ON o.product_id = p.product_id
GROUP BY p.product_name;

---------------------------------------------------
-- 5. Sort grouped data by total sales descending
---------------------------------------------------

SELECT 
    p.product_name,
    SUM(o.total_price) AS Total_Sales
FROM Order_Details o
JOIN Products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Sales DESC;