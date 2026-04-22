# Online Store Database

📌 Project Overview

This project is a relational database design for an e-commerce platform. It models the core operations of an online store, including customer management, product catalog, order processing, and order tracking.

The database is designed using MySQL and follows normalization principles to ensure data integrity, reduce redundancy, and support scalable data operations.

🧠 Design Decisions

- Designed the database following **Third Normal Form (3NF)** to eliminate redundancy and ensure consistency.
- Used **ON DELETE RESTRICT** to prevent deletion of customers and products that are linked to existing orders, preserving historical data.
- Applied **ON DELETE CASCADE** in the order_detail table to automatically remove dependent records when an order is deleted.
- Implemented **UNIQUE constraint** on (order_id, product_id) to avoid duplicate products in the same order.
- Added **CHECK constraints** to enforce valid values for price, stock, quantity, and order status.
  
📚Features

- Customer management.
- Product catalog with stock tracking.
- Order processing system.
- Order details for tracking purchased items.  
- Data integrity using constraints and relationships.  
 
🧩 Database Design

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

💻 Technologies

- MySQL (running on XAMPP local server).
- SQL (Data Definition Language & Data Manipulation Language).  
- DBeaver (database client for development and testing). 

🔩 How to Run

1. Start MySQL using XAMPP.
2. Open DBeaver or any MySQL client.
3. Run the `schema.sql` file to create the database and tables.
4. Run `sample_data.sql` to populate the database.
5. Execute queries from `queries.sql` to test the system.

📈 Example Queries

-- Total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_detail;

-- Top customers
SELECT c.first_name, COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_orders DESC;

📊 ER Diagram

![ER Diagram](ER_Diagram.png)
