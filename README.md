# 📚 Bookstore — SQL Project

A SQL exploratory data analysis (EDA) project on a relational bookstore dataset covering books, customers, and orders. The analysis explores sales performance, customer behaviour, inventory levels, and revenue insights.

---

## 📁 Project Structure

```
bookstore/
│
├── Books.csv                  # Books inventory dataset
├── Customers.csv              # Customer details dataset
├── Orders.csv                 # Orders transaction dataset
└── bookstore_eda.sql          # Exploratory Data Analysis
```

---

## 📊 Dataset Overview

### Books.csv
**Rows:** 500

| Column | Description |
|---|---|
| `Book_ID` | Unique book identifier |
| `Title` | Book title |
| `Author` | Author name |
| `Genre` | Genre (Fiction, Fantasy, Mystery, Romance, etc.) |
| `Published_Year` | Year of publication |
| `Price` | Book price (USD) |
| `Stock` | Current stock quantity |

### Customers.csv
**Rows:** 500

| Column | Description |
|---|---|
| `Customer_ID` | Unique customer identifier |
| `Name` | Customer full name |
| `Email` | Customer email address |
| `Phone` | Customer phone number |
| `City` | Customer city |
| `Country` | Customer country |

### Orders.csv
**Rows:** 500

| Column | Description |
|---|---|
| `Order_ID` | Unique order identifier |
| `Customer_ID` | Links to Customers table |
| `Book_ID` | Links to Books table |
| `Order_Date` | Date of the order |
| `Quantity` | Number of books ordered |
| `Total_Amount` | Total order value (USD) |

---

## 🔍 Exploratory Data Analysis

**File:** `bookstore_eda.sql`

### Step 1 — Basic Filtering
Explored subsets of the data using `WHERE` filters — fiction books, books published after 1950, Canadian customers, November 2023 orders, and orders above a quantity or amount threshold.

### Step 2 — Book Inventory Insights
Calculated total stock across all books, identified the most expensive book, the book with the lowest stock, all distinct genres, and the top 3 most expensive Fantasy books.

### Step 3 — Revenue Analysis
Calculated total revenue across all 500 orders using `SUM(Total_Amount)`.

### Step 4 — Genre-Level Sales Analysis
Aggregated total quantity sold per genre using a `JOIN` between orders and books. Also calculated the average price of Fantasy books.

### Step 5 — Customer Analysis
Identified repeat customers (2+ orders), the single highest spending customer by total amount, and average order value per city.

### Step 6 — Most Ordered Books
Ranked the top 10 books by number of orders placed using `COUNT(Order_ID)` with a `JOIN` to include book titles.

### Step 7 — Author-Level Sales
Aggregated total quantity sold per author to identify the most popular authors by volume.

### Step 8 — Remaining Stock Per Book
Calculated remaining stock for every book by subtracting total ordered quantities from original stock. Used `LEFT JOIN` and `COALESCE` to correctly handle books with no orders.

---

## 🛠️ How to Run

1. Create a database in your MySQL environment
2. Import `Books.csv` as table `books`
3. Import `Customers.csv` as table `customers`
4. Import `Orders.csv` as table `orders`
5. Run `bookstore_eda.sql` step by step

---

## 💡 Key SQL Concepts Used

| Concept | Used In |
|---|---|
| `WHERE` with date ranges and conditions | Basic filtering |
| `ORDER BY` + `LIMIT` | Finding top/bottom records |
| `DISTINCT` | Listing unique genres |
| `SUM`, `AVG`, `COUNT`, `ROUND` | Aggregation and revenue analysis |
| `JOIN` (INNER) | Linking orders to books and customers |
| `LEFT JOIN` | Retaining books with no orders |
| `COALESCE` | Handling NULL quantities for unordered books |
| `GROUP BY` + `HAVING` | Grouped aggregations and filtering |
| Named column aliases | Clean, readable output headers |
