
CREATE DATABASE IF NOT EXISTS online_store;
USE online_store;

CREATE TABLE customer (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(150) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
phone VARCHAR(20),
address VARCHAR(255),
registration_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE product (
product_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(150) NOT NULL,
description TEXT,
price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATE DEFAULT CURRENT_DATE,
order_status VARCHAR(20) NOT NULL DEFAULT 'pending',
shipping_address VARCHAR(255),
payment_method VARCHAR(50),

CONSTRAINT fk_order_customer
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,

CONSTRAINT chk_order_status
CHECK (order_status IN ('pending', 'shipped', 'delivered', 'cancelled'))
);

CREATE TABLE order_detail (
order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),

CONSTRAINT fk_ordersdetail_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id)
ON DELETE CASCADE
ON UPDATE CASCADE,

CONSTRAINT fk_ordersdetail_product
FOREIGN KEY (product_id)
REFERENCES product(product_id)
ON DELETE RESTRICT 
ON UPDATE CASCADE,

CONSTRAINT unique_order_product
UNIQUE (order_id, product_id)
);
