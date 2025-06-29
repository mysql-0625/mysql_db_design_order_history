SHOW DATABASES;

CREATE DATABASE mysql_order_history;

USE mysql_order_history;

-- Table orders untuk duplikat data yang hanya cukup muncul sekali
CREATE TABLE orders(
	id VARCHAR(100) NOT NULL PRIMARY KEY,
    seller_id VARCHAR(100) NOT NULL,
    seller_name VARCHAR(100) NOT NULL,
    buyer_id VARCHAR(100) NOT NULL,
    buyer_name VARCHAR(100) NOT NULL,
    shipping_name VARCHAR(100) NOT NULL,
    shipping_address VARCHAR(500) NOT NULL,
    shipping_phone VARCHAR(100) NOT NULL,
    logistic_id VARCHAR(100) NOT NULL,
    logistic_name VARCHAR(100) NOT NULL,
    payment_method_id VARCHAR(100) NOT NULL,
    payment_method_name VARCHAR(100) NOT NULL,
    total_quantity INT NOT NULL,
    total_weight INT NOT NULL,
    total_product_amount BIGINT NOT NULL,
    total_shipping_cost BIGINT NOT NULL,
    total_shopping_amount BIGINT NOT NULL,
    service_charge BIGINT NOT NULL,
    total_amount BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL
);

DESC orders;

-- Table order detail untuk duplikat data yang bisa muncul berkali-kali
CREATE TABLE order_details (
	id VARCHAR(100) PRIMARY KEY,
    order_id VARCHAR(100) NOT NULL,
    product_id VARCHAR(100) NOT NULL,
    product_name VARCHAR(250) NOT NULL,
    product_weight INT NOT NULL,
    product_price BIGINT NOT NULL,
    quantity INT NOT NULL,
    total_amount BIGINT NOT NULL,
    FOREIGN KEY fk_orders_to_order_details (order_id) REFERENCES orders(id)
);

DESC order_details;

-- Insert data orders
INSERT INTO orders 
(id, created_at, seller_id, seller_name, buyer_id, buyer_name, shipping_name, shipping_address, shipping_phone,
logistic_id, logistic_name, payment_method_id, payment_method_name, total_quantity, total_weight, total_product_amount, 
total_shipping_cost, total_shopping_amount, service_charge, total_amount)
VALUES 
('234', NOW(), 'adidas_indonesia', 'Adidas Indonesia', 'mhasan', 'M. Hasan', 'Ahmad Saifur', 'Jalan Raya Cinta, Jakarta, DKI Jakarta, 14732', '098123123123',
'siwosh', 'Si Woshhh', 'debit_online', 'Debit Online', 5, 5360, 508500, 
60000, 568500, 1000, 569500);

SELECT * FROM orders;

-- Insert data order details
INSERT INTO order_details (id, order_id, product_id, product_name, product_weight, product_price, quantity, total_amount)
					VALUES ('1', '234', 'P001', 'Adidas Samba 320', 2300, 177900, 2, 355800);

INSERT INTO order_details (id, order_id, product_id, product_name, product_weight, product_price, quantity, total_amount)
					VALUES ('2', '234', 'P002', 'Running Adidas MS10', 500, 98900, 1, 98900);

INSERT INTO order_details(id, order_id, product_id, product_name, product_weight, product_price, quantity, total_amount)
					VALUES ('3', '234', 'P003', 'Sport BD031 Adidas', 54, 9900, 1, 9900);

INSERT INTO order_details(id, order_id, product_id, product_name, product_weight, product_price, quantity, total_amount)
					VALUES ('4', '234', 'P004', 'Adidas Sneakers 110', 198, 43900, 1, 43900);

SELECT * FROM order_details;

-- query by id di 2 table masing-masing
SELECT * FROM orders WHERE id = 234;
SELECT * FROM order_details WHERE order_id = 234;

-- query by id di 2 table dengan join
SELECT * FROM orders o JOIN order_details od ON o.id = od.order_id WHERE o.id = 234;





