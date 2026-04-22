# Online Store Database

## 📌 Project Overview

This project is a relational database design for an e-commerce platform. It models the core operations of an online store, including customer management, product catalog, order processing, and order tracking.

The database is designed using MySQL and follows normalization principles to ensure data integrity, reduce redundancy, and support scalable data operations.

## 🧠 Design Decisions

The database was designed to reflect real-world e-commerce constraints and ensure data consistency.

- Designed the database following **Third Normal Form (3NF)** to eliminate redundancy and ensure consistency.
- Used **ON DELETE RESTRICT** to prevent deletion of customers and products that are linked to existing orders, preserving historical data.
- Applied **ON DELETE CASCADE** in the order_detail table to automatically remove dependent records when an order is deleted.
- Implemented **UNIQUE constraint** on (order_id, product_id) to avoid duplicate products in the same order.
- Added **CHECK constraints** to enforce valid values for price, stock, quantity, and order status.
  
## 📚Features

- Manage customer information and order history.  
- Track product inventory and availability.  
- Process customer orders with multiple items.  
- Ensure data integrity through constraints and relationships.  
- Support business analytics through SQL queries.  

 
## 🧩 Database Design

The database is structured around four main entities:

- **Customer**: stores user information. 
- **Product**: contains product data.
- **Orders**: represents customer purchases.
- **Order_Detail**: links products and orders (many-to-many relationship).  

### Relationships

- One customer can have multiple orders.  
- Each order belongs to one customer.  
- One order can contain multiple products.  
- Products can appear in multiple orders.  

## 📊 ER Diagram

![ER Diagram](ER_Diagram.png)

## 🔩 How to Run

1. Start MySQL using XAMPP.
2. Open DBeaver or any MySQL client.
3. Run the `schema.sql` file to create the database and tables.
4. Run `sample_data.sql` to populate the database.
5. Execute queries from `queries.sql` to test the system.

## 📦 Sample Data

To demonstrate real-world usage, the database can be populated using the `sample_data.sql` script.

This file inserts realistic sample records across all tables, enabling:
- Testing of relationships and constraints  
- Execution of analytical queries  
- Simulation of business scenarios  

### How to use

1. Run `schema.sql`  
2. Run `sample_data.sql`  
3. Execute queries from `queries.sql`

## 📈 Example Queries

These queries demonstrate how the database can be used to extract business insights from transactional data.

-- Total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_detail;

-- Top customers
SELECT c.first_name, COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_orders DESC;

These queries simulate real-world business scenarios such as revenue analysis, customer behavior tracking, and product performance evaluation.

## 💻 Technologies

- MySQL (running on XAMPP local server).
- SQL (Data Definition Language & Data Manipulation Language).  
- DBeaver (database client for development and testing).

## 🚀 Future Improvements

- Add triggers to automatically update product stock after orders.  
- Implement views for reporting.  
- Extend schema with categories and payments.

## 🎯 Purpose

This project was developed to practice relational database design and demonstrate SQL skills in a real-world scenario.


