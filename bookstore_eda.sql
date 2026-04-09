-- ============================================================
-- Bookstore Project — Exploratory Data Analysis
-- Datasets : Books.csv | Customers.csv | Orders.csv
-- Rows     : 500 (Books) | 500 (Customers) | 500 (Orders)
-- Author   : (Your Name)
-- ============================================================


-- ============================================================
-- STEP 0: Preview all three tables
-- ============================================================

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;


-- ============================================================
-- STEP 1: Basic Filtering
-- Simple queries to explore subsets of the data.
-- ============================================================

-- All Fiction books
SELECT *
FROM books
WHERE Genre = 'Fiction';

-- Books published after 1950
SELECT *
FROM books
WHERE Published_Year > 1950;

-- Customers from Canada
SELECT *
FROM customers
WHERE Country = 'Canada';

-- Orders placed in November 2023
SELECT *
FROM orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- Orders with quantity greater than 1
SELECT *
FROM orders
WHERE Quantity > 1
ORDER BY Quantity;

-- Orders with total amount greater than $20
SELECT *
FROM orders
WHERE Total_Amount > 20;


-- ============================================================
-- STEP 2: Book Inventory Insights
-- ============================================================

-- Total stock across all books
SELECT SUM(Stock) AS Total_Stock
FROM books;

-- Most expensive book
SELECT *
FROM books
ORDER BY Price DESC
LIMIT 1;

-- Book with the lowest stock (at risk of going out of stock)
SELECT *
FROM books
ORDER BY Stock
LIMIT 1;

-- All distinct genres available
SELECT DISTINCT Genre
FROM books;

-- Top 3 most expensive Fantasy books
SELECT *
FROM books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;


-- ============================================================
-- STEP 3: Revenue Analysis
-- ============================================================

-- Total revenue across all orders
SELECT ROUND(SUM(Total_Amount), 2) AS Total_Revenue
FROM orders;


-- ============================================================
-- STEP 4: Genre-Level Sales Analysis
-- ============================================================

-- Total quantity of books sold per genre
SELECT 
    b.Genre, 
    SUM(o.Quantity) AS Total_Books_Sold
FROM orders o
JOIN books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Genre
ORDER BY Total_Books_Sold DESC;


-- Average price of Fantasy books
SELECT 
    AVG(Price) AS Avg_Fantasy_Price
FROM books
WHERE Genre = 'Fantasy';


-- ============================================================
-- STEP 5: Customer Analysis
-- ============================================================

-- Customers who have placed 2 or more orders (repeat customers)
SELECT 
    c.Customer_ID,
    c.Name, 
    COUNT(o.Order_ID) AS Order_Count
FROM customers c
JOIN orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
HAVING Order_Count >= 2
ORDER BY Order_Count DESC;


-- Top spending customer by total amount spent
SELECT 
    c.Customer_ID, 
    c.Name, 
    ROUND(SUM(o.Total_Amount), 1) AS Total_Spent
FROM customers c
JOIN orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Spent DESC
LIMIT 1;


-- Average spend per city
SELECT 
    c.City, 
    ROUND(AVG(o.Total_Amount), 2) AS Avg_Order_Amount
FROM customers c
JOIN orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.City
ORDER BY Avg_Order_Amount DESC;


-- ============================================================
-- STEP 6: Most Ordered Books
-- Identifies the top 10 books by number of orders placed.
-- ============================================================

SELECT 
    b.Book_ID, 
    b.Title, 
    COUNT(o.Order_ID) AS Order_Count
FROM orders o
JOIN books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Book_ID, b.Title
ORDER BY Order_Count DESC
LIMIT 10;


-- ============================================================
-- STEP 7: Author-Level Sales
-- Total quantity of books sold per author.
-- ============================================================

SELECT 
    b.Author, 
    SUM(o.Quantity) AS Total_Quantity_Sold
FROM orders o
JOIN books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Author
ORDER BY Total_Quantity_Sold DESC;


-- ============================================================
-- STEP 8: Remaining Stock Per Book
-- Calculates remaining stock after accounting for all orders.
-- Uses COALESCE to handle books with no orders (stock unchanged).
-- ============================================================

SELECT 
    b.Book_ID, 
    b.Title, 
    b.Stock                              AS Original_Stock,
    COALESCE(SUM(o.Quantity), 0)         AS Total_Ordered,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_Stock
FROM books b
LEFT JOIN orders o
    ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock
ORDER BY Remaining_Stock ASC;
