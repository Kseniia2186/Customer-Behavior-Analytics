-- 1. Create Database and Use It
CREATE DATABASE IF NOT EXISTS OnlineStore2;
USE OnlineStore2;

-- 2. Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Region VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    OrderDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 3. Insert Data

-- Customers
INSERT INTO Customers (CustomerID, Name, Region) VALUES
(1, 'John Hill', 'North'),
(2, 'Emma Fox', 'East'),
(3, 'Liam Wood', 'West'),
(4, 'Ava Lee', 'South'),
(5, 'Noah King', 'East'),
(6, 'Mia Ray', 'East'),
(7, 'Jack Cole', 'North'),
(8, 'Lily Moon', 'West'),
(9, 'Ryan Dale', 'South'),
(10, 'Zoe Kim', 'South'),
(11, 'Luke Nash', 'West'),
(12, 'Anna West', 'West'),
(13, 'Eli Ford', 'South'),
(14, 'Nina Bell', 'West'),
(15, 'Owen Hart', 'East');

-- Products
INSERT INTO Products (ProductID, ProductName, Category) VALUES
(101, 'Bamboo Toothbrush', 'Personal Care'),
(102, 'LED Desk Lamp', 'Home & Office'),
(103, 'Stainless Steel Bottle', 'Kitchenware'),
(104, 'Organic Green Tea', 'Beverages'),
(105, 'Cotton Tote Bag', 'Accessories'),
(106, 'Noise Canceling Earbuds', 'Electronics'),
(107, 'Yoga Mat Pro', 'Sports & Fitness'),
(108, 'Ceramic Plant Pot', 'Home Décor'),
(109, 'Bluetooth Speaker Mini', 'Electronics'),
(110, 'Reusable Food Wraps', 'Kitchenware'),
(111, 'Daily Planner 2026', 'Stationery'),
(112, 'Kids Puzzle Set', 'Toys & Games'),
(113, 'Eco-Friendly Notebook', 'Stationery'),
(114, 'Leather Wallet', 'Fashion'),
(115, 'Scented Soy Candle', 'Home Décor'),
(116, 'Portable Phone Charger', 'Electronics'),
(117, 'Wool Socks Set', 'Apparel'),
(118, 'Herbal Face Mask', 'Personal Care'),
(119, 'Magnetic Knife Rack', 'Kitchenware'),
(120, 'Mini Backpack', 'Fashion');

-- Orders
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, Price, OrderDate) VALUES
(1001, 1, 101, 1, 3.99, '2024-01-15'),
(1002, 2, 102, 2, 19.99, '2024-02-10'),
(1003, 1, 103, 1, 14.49, '2024-03-05'),
(1004, 3, 101, 1, 3.99, '2024-03-20'),
(1005, 2, 111, 1, 11.99, '2024-04-01'),
(1006, 5, 114, 3, 98.99, '2024-04-02'),
(1007, 13, 109, 2, 34.5, '2024-04-02'),
(1008, 10, 108, 1, 12.75, '2024-04-02'),
(1009, 4, 120, 1, 27.5, '2024-04-05'),
(1010, 1, 120, 3, 27.5, '2024-04-15'),
(1011, 7, 107, 5, 24.99, '2024-04-17'),
(1012, 15, 113, 1, 6.75, '2024-04-17'),
(1013, 1, 119, 1, 17.25, '2024-04-20'),
(1014, 9, 112, 1, 8.5, '2024-05-01'),
(1015, 3, 117, 3, 15.99, '2024-05-02');

-- 4. Analytical Queries

-- Total Spent per Customer
SELECT c.Name, SUM(o.Quantity * o.Price) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Name
ORDER BY TotalSpent DESC;

-- Total Orders per Region
SELECT c.Region, COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Region;

-- Most Popular Products
SELECT p.ProductName, COUNT(*) AS TimesOrdered
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TimesOrdered DESC;

--  Average Order Value per Customer
SELECT c.Name, AVG(o.Quantity * o.Price) AS AverageOrderValue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Name;

-- Monthly Revenue
SELECT DATE_FORMAT(o.OrderDate, '%Y-%m') AS Month, SUM(o.Quantity * o.Price) AS MonthlyRevenue
FROM Orders o
GROUP BY Month
ORDER BY Month;

-- Sales by Product Category
SELECT p.Category, SUM(o.Quantity * o.Price) AS CategorySales
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY CategorySales DESC;

-- Unique Customers per Region
SELECT c.Region, COUNT(DISTINCT c.CustomerID) AS UniqueCustomers
FROM Customers c
GROUP BY c.Region;

-- Customers Without Orders
SELECT c.Name
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

