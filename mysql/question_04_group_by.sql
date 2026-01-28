-- Question: Calculate the total sales for each product
-- Sample Data:
-- CREATE TABLE sales (product_id INT, amount DECIMAL(10, 2));
-- INSERT INTO sales VALUES (1, 100.00), (1, 150.00), (2, 200.00);

-- Solution:
SELECT product_id, SUM(amount) as total_sales
FROM sales
GROUP BY product_id;

-- Explanation: This query groups sales data by product ID and calculates the sum of sales for each product.