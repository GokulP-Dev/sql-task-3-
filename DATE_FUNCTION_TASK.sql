-- Create Database
CREATE DATABASE EventDB;

-- Use Database
USE EventDB;

-- Create Table
CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATETIME
);

-- Insert Data
INSERT INTO events VALUES
(1, 'Tech Conference', '2026-05-15 10:30:00'),
(2, 'Music Festival', '2026-06-20 06:00:00'),
(3, 'Sports Meet', '2026-07-10 09:15:00'),
(4, 'College Day', '2026-08-05 11:45:00');

-- Display All Records
SELECT * FROM events;

-- Display Current Date & Time
SELECT NOW() AS Current_Date_Time;

-- Format event_date
SELECT 
    id,
    event_name,
    DATE_FORMAT(event_date, '%d-%m-%Y %h:%i %p') AS formatted_date
FROM events;

-- Extract YEAR and MONTH
SELECT 
    event_name,
    YEAR(event_date) AS Event_Year,
    MONTH(event_date) AS Event_Month
FROM events;

-- Combine event_name and event_date using CONCAT()
SELECT 
    CONCAT(event_name, ' - ', event_date) AS Event_Details
FROM events;