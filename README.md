# Bookstore — SQL Project

A SQL exploratory data analysis project on a relational bookstore dataset covering books, customers, and orders.

---

## Short Description

A SQL EDA project analysing sales performance, customer behaviour, inventory levels, and revenue insights across a bookstore dataset with 3 related tables — books, customers, and orders.

---

## Business Objective

The goal of this project is to explore bookstore data and answer practical business questions — which books and genres sell best, who the top customers are, how much revenue is being generated, and which books are at risk of going out of stock.

---

## Tools Used

- MySQL
- SQL (Joins, Aggregations, Subqueries)

---

## Dataset

3 tables, 500 rows each.

| Table | Description |
|-------|-------------|
| Books.csv | Book inventory — title, author, genre, price, stock |
| Customers.csv | Customer details — name, city, country |
| Orders.csv | Transactions — order date, quantity, total amount |

---

## What I Did

**Step 1 — Basic Filtering**
Explored data subsets using WHERE filters — fiction books, books published after 1950, Canadian customers, November 2023 orders, and orders above quantity/amount thresholds.

**Step 2 — Book Inventory Insights**
Calculated total stock, identified the most expensive book, lowest stock book, all distinct genres, and top 3 most expensive Fantasy books.

**Step 3 — Revenue Analysis**
Calculated total revenue across all 500 orders.

**Step 4 — Genre-Level Sales**
Aggregated total quantity sold per genre using a JOIN between orders and books. Calculated average price of Fantasy books.

**Step 5 — Customer Analysis**
Identified repeat customers (2+ orders), the highest spending customer, and average order value per city.

**Step 6 — Most Ordered Books**
Ranked the top 10 books by number of orders using COUNT with a JOIN to include book titles.

**Step 7 — Author-Level Sales**
Aggregated total quantity sold per author to identify the most popular authors by volume.

**Step 8 — Remaining Stock Per Book**
Calculated remaining stock by subtracting total ordered quantities from original stock. Used LEFT JOIN and COALESCE to handle books with no orders.

---

## Key SQL Concepts Used

| Concept | Used In |
|---------|---------|
| `WHERE` with date ranges and conditions | Basic filtering |
| `ORDER BY` + `LIMIT` | Finding top/bottom records |
| `DISTINCT` | Listing unique genres |
| `SUM`, `AVG`, `COUNT`, `ROUND` | Aggregation and revenue analysis |
| `INNER JOIN` | Linking orders to books and customers |
| `LEFT JOIN` | Retaining books with no orders |
| `COALESCE` | Handling NULL quantities for unordered books |
| `GROUP BY` + `HAVING` | Grouped aggregations and filtering |

---

## How to Run

1. Create a database in MySQL
2. Import `Books.csv`, `Customers.csv`, and `Orders.csv` as tables
3. Run `bookstore_eda.sql` step by step
