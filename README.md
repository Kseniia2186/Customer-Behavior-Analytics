# Customer Behavior Analytics

## 📊 Overview

This project demonstrates how to analyze customer behavior using SQL and Excel. It simulates a small online store and tracks purchases, product categories, and regional performance. The goal is to extract insights from customer data and visualize them in a clear and interactive dashboard.

---

## 🛠️ Tools Used

- **MySQL Workbench** – for database creation, data manipulation, and analytical queries  
- **Microsoft Excel** – for building dashboards with pivot tables, slicers, and charts

---

## 📁 Project Files

- **SQL Script:**  
  Full code for:
  - Creating the database `OnlineStore2`
  - Creating and populating tables `Customers`, `Products`, and `Orders`
  - Running analytical queries (sales, regions, product popularity, etc.)

- **Excel Workbook:**  
  Includes:
  - Raw data (from SQL): Customers, Products, Orders
  - Pre-calculated fields: Total Amount, Monthly Revenue
  - Pivot tables and charts for:
    - Total sales by product category
    - Monthly revenue
  - Interactive dashboard with slicers and KPI metrics

- **Dashboard Screenshot:**  
  PNG image showing the final Excel dashboard

---

## 🧩 Database Structure

**Customers**  
- `CustomerID` (INT, PK)  
- `Name` (VARCHAR)  
- `Region` (VARCHAR)

**Products**  
- `ProductID` (INT, PK)  
- `ProductName` (VARCHAR)  
- `Category` (VARCHAR)

**Orders**  
- `OrderID` (INT, PK)  
- `CustomerID` (FK)  
- `ProductID` (FK)  
- `Quantity` (INT)  
- `Price` (DECIMAL)  
- `OrderDate` (DATETIME)

---

## 📈 Key Insights (from SQL queries)

- **💰 Total Revenue per Customer**
- **📦 Orders per Region**
- **⭐ Most Popular Products**
- **📅 Monthly Sales Trends**
- **📊 Sales by Product Category**
- **👥 Unique Customers per Region**
- **🔍 Customers Without Orders**

---

## 📊 Excel Dashboard Features

- **Key Metrics (KPI block):**
  - Total Revenue: `$768.58`
  - Total Orders: `15`
  - Avg Order Value: `$51.24`
  - Units Sold: `27`
  - Unique Customers: `10`

- **Visualizations:**
  - Pie chart for **Total Sales by Product Category**
  - Line chart for **Monthly Revenue**
  - Interactive slicers for **Category**, **Month**, and **Region**

---

## 💡 Purpose

This beginner-level project is ideal for showcasing:
- SQL querying skills
- Data preparation and export
- Dashboard building in Excel
- Business analysis and insight generation

Great for entry-level **Data Analyst** or **Database-related** roles.

---

## 📷 Preview

![Dashboard Preview](Customer_Behavior_Dashboard.png)
