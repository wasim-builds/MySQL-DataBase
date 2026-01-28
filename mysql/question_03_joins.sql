-- Question: Retrieve all orders and their corresponding customer names
-- Sample Data:
-- CREATE TABLE orders (order_id INT, customer_id INT);
-- CREATE TABLE customers (customer_id INT, customer_name VARCHAR(100));
-- INSERT INTO orders VALUES (1, 101), (2, 102);
-- INSERT INTO customers VALUES (101, 'Alice'), (102, 'Bob');

-- Solution:
SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Explanation: This query joins orders with customers to display order IDs along with customer names.