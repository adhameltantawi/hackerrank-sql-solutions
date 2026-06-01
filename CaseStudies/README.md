<div align="center">

# 📊 SQL Case Studies

[![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/en-us/sql-server)
[![T-SQL](https://img.shields.io/badge/T--SQL-Advanced-0078D4?style=for-the-badge)](https://learn.microsoft.com/en-us/sql/t-sql/)

**Window Functions** · **CTEs** · **Stored Procedures** · **Recursive Queries** · **Views** · **Data Quality**

</div>

---

## 📁 Module Breakdown

### 📌 `customer_analytics.sql`

<details>
<summary><b>🔍 Details</b></summary>

| # | Business Question | Techniques |
|---|-------------------|------------|
| 1 | Rank customers by total revenue | `RANK()`, `OVER()`, derived tables |
| 2 | Customer loyalty via order frequency | `LEAD()`, `DATEDIFF()`, `PARTITION BY` |
| 3 | Average scores handling NULLs | `COALESCE()`, `AVG() OVER()` |
| 4 | Customer profile with order counts | `LEFT JOIN` with aggregated subquery |
| 5 | Order counts via correlated subquery | Correlated `SELECT` subquery |
| 6 | Filter orders by geography (IN) | `IN` with subquery |
| 7 | Filter orders by geography (EXISTS) | `EXISTS` with correlated subquery |
| 8 | **Customer segmentation pipeline** | Multi-CTE chain → rank → segment |

</details>

---

### 📌 `sales_analysis.sql`

<details>
<summary><b>🔍 Details</b></summary>

| # | Business Question | Techniques |
|---|-------------------|------------|
| 1 | Moving average per product | `AVG() OVER(PARTITION BY ... ORDER BY ...)` |
| 2 | Rolling average with fixed frame | `ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING` |
| 3 | Percentage contribution to total | `SUM() OVER()`, `CAST`, `ROUND` |
| 4 | Global vs. per-product averages | Multiple `AVG() OVER()` partitions |
| 5 | Deviation from min/max sales | `MAX() OVER()`, `MIN() OVER()` |
| 6 | Lowest & highest sales per product | `FIRST_VALUE()`, `LAST_VALUE()` |
| 7 | Sales difference from minimum | `MIN() OVER()` with arithmetic |
| 8 | Total orders globally vs. per customer | `COUNT(*) OVER()` |
| 9 | Orders exceeding average sales | Derived table + `WHERE` filter |
| 10 | Month-over-month growth rate | `LAG()`, `SUM()`, `ROUND()` |
| 11 | Running total of monthly sales | `CREATE VIEW`, `SUM() OVER(ORDER BY)` |
| 12 | Monthly summary materialization | `SELECT INTO`, `DATENAME()` |

</details>

---

### 📌 `data_modeling_and_views.sql`

<details>
<summary><b>🔍 Details</b></summary>

| # | Business Question | Techniques |
|---|-------------------|------------|
| 1 | Unified order details (4 tables) | `CREATE VIEW`, multi-table `LEFT JOIN`, `COALESCE` |
| 2 | Region-filtered view for EU team | View with `WHERE` filter |

</details>

---

### 📌 `hr_and_data_quality.sql`

<details>
<summary><b>🔍 Details</b></summary>

| # | Business Question | Techniques |
|---|-------------------|------------|
| 1 | Employees with highest salary | `MAX() OVER()`, derived table |
| 2 | Gender-based salary comparison | `ANY()` with subquery |
| 3 | Duplicate detection in archive | `COUNT(*) OVER(PARTITION BY ...)` |
| 4 | Organizational hierarchy tree | **Recursive CTE** with `UNION ALL` |

</details>

---

### 📌 `product_insights.sql`

<details>
<summary><b>🔍 Details</b></summary>

| # | Business Question | Techniques |
|---|-------------------|------------|
| 1 | Above-average products (window) | `AVG() OVER()`, derived table |
| 2 | Above-average products (subquery) | Scalar subquery in `WHERE` |
| 3 | Product catalog with order count | Correlated scalar subquery |

</details>

---

### 📌 `stored_procedures.sql`

<details>
<summary><b>🔍 Details</b></summary>

| Feature | Implementation |
|---------|---------------|
| **Parameter** | `@Country NVARCHAR(50)` — default `'USA'` |
| **Cleanup** | Conditional `NULL` → `0` update |
| **Output** | Customer count, avg score, total orders/sales |
| **Error Handling** | `TRY/CATCH` with full diagnostics |

</details>

---

## ⚙️ Schema Reference

```
Sales.Orders        — OrderID, OrderDate, CustomerID, ProductID, SalesPersonID, Sales, Quantity
Sales.Customers     — CustomerID, FirstName, LastName, Country, Score
Sales.Products      — ProductID, Product, Category, Price
Sales.Employees     — EmployeeID, FirstName, LastName, Gender, Salary, Department, ManagerID
Sales.OrdersArchive — Archive table for data quality checks
```

---

<div align="center">

**⬆️ [Back to Main Repository](../README.md)**

</div>
