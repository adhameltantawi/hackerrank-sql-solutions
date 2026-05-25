# SQL Case Studies — Business Analytics

A collection of SQL case studies organized by business domain, built on the `Sales` database.

## 📁 Structure

| File | Domain | Cases |
|------|--------|:-----:|
| `sales_analysis.sql` | Revenue trends, moving averages, MoM change | 10 |
| `customer_analytics.sql` | Segmentation, loyalty ranking, market filtering | 7 |
| `product_insights.sql` | Pricing analysis, product catalog | 3 |
| `hr_and_data_quality.sql` | Salary analysis, duplicate detection | 3 |

## 🗄️ Database Schema

All queries target the `Sales` schema with the following tables:

- **`Sales.Orders`** — OrderID, ProductID, CustomerID, OrderDate, Sales
- **`Sales.Products`** — ProductID, Product, Price
- **`Sales.Customers`** — CustomerID, LastName, Country, Score
- **`Sales.Employees`** — EmployeeID, FirstName, Gender, Salary
- **`Sales.OrdersArchive`** — Archived orders for data quality checks
