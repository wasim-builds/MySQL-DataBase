-- Normalize denormalized data into separate tables
-- Step 1: Create normalized tables
CREATE TABLE customers_normalized AS
SELECT DISTINCT customer_id, customer_name, customer_email
FROM orders_denormalized;

-- Step 2: Create orders table without customer details
CREATE TABLE orders_normalized AS
SELECT order_id, customer_id, order_date, total_amount
FROM orders_denormalized;