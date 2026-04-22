USE online_store;

-- =========================================
-- INSERT CUSTOMERS 
-- =========================================
INSERT INTO customer (first_name, last_name, email, phone, address)
VALUES
('Carlos', 'García', 'c.garcia@correo.com', '612 345 678', 'Calle Mayor 15, 28013 Madrid'),
('Lucía', 'Martínez', 'lucia.martinez@gmail.com', '678 912 345', 'Carrer de Colón 22, 46004 Valencia'),
('Javier', 'López', 'javier.lopez@hotmail.com', '645 778 990', 'Gran Vía 18, 48001 Bilbao'),
('María', 'Fernández', 'maria.fernandez@outlook.com', '699 112 233', 'Avenida Andalucía 45, 29007 Málaga'),
('Sofía', 'Ruiz', 'sofia.ruiz@gmail.com', '622 334 455', 'Calle Alfonso I 10, 50003 Zaragoza');

-- =========================================
-- INSERT PRODUCTS 
-- =========================================
INSERT INTO product (name, description, price, stock)
VALUES
('Portátil Lenovo IdeaPad', 'Portátil ideal para trabajo y estudios con buena autonomía', 749.99, 12),
('iPhone 14', 'Smartphone Apple con gran rendimiento y cámara avanzada', 999.00, 18),
('Auriculares Sony WH-1000XM4', 'Auriculares con cancelación activa de ruido', 279.90, 25),
('Ratón Logitech MX Master 3', 'Ratón inalámbrico ergonómico para productividad', 89.99, 40),
('Teclado mecánico Keychron K2', 'Teclado compacto mecánico con retroiluminación RGB', 109.00, 20);

-- =========================================
-- INSERT ORDERS
-- =========================================
INSERT INTO orders (customer_id, order_status, shipping_address, payment_method)
VALUES
(1, 'pending', 'Calle Mayor 15, 28013 Madrid', 'tarjeta_credito'),
(2, 'shipped', 'Carrer de Colón 22, 46004 Valencia', 'paypal'),
(3, 'delivered', 'Gran Vía 18, 48001 Bilbao', 'tarjeta_credito'),
(4, 'delivered', 'Avenida Andalucía 45, 29007 Málaga', 'tarjeta_credito'),
(5, 'cancelled', 'Calle Alfonso I 10, 50003 Zaragoza', 'transferencia_bancaria');

-- =========================================
-- INSERT ORDER DETAILS
-- =========================================
INSERT INTO order_detail (order_id, product_id, quantity, unit_price)
VALUES
-- Order 1 (Carlos)
(1, 1, 1, 749.99),
(1, 4, 1, 89.99),

-- Order 2 (Lucía)
(2, 2, 1, 999.00),
(2, 3, 1, 279.90),

-- Order 3 (Javier)
(3, 5, 1, 109.00),
(3, 4, 1, 89.99),

-- Order 4 (María)
(4, 3, 1, 279.90),
(4, 1, 1, 749.99),

-- Order 5 (Sofía - cancelled)
(5, 2, 1, 999.00);
