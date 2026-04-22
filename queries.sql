-- =========================================
-- SAMPLE ANALYTICAL QUERIES
-- =========================================

-- Total revenue generated
SELECT ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM order_detail;


-- Customers with most orders
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_orders DESC;


-- Most sold products
SELECT 
    p.name,
    SUM(od.quantity) AS total_sold
FROM product p
JOIN order_detail od ON p.product_id = od.product_id
GROUP BY p.product_id, p.name
ORDER BY total_sold DESC;


-- Detailed order information
SELECT 
    o.order_id,
    c.first_name,
    p.name AS product,
    od.quantity,
    od.unit_price
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_detail od ON o.order_id = od.order_id
JOIN product p ON od.product_id = p.product_id
ORDER BY o.order_id;


-- Revenue generated per product
SELECT 
    p.name,
    ROUND(SUM(od.quantity * od.unit_price), 2) AS revenue
FROM product p
JOIN order_detail od ON p.product_id = od.product_id
GROUP BY p.product_id, p.name
ORDER BY revenue DESC;