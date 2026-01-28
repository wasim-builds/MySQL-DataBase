-- Calculate customer lifetime value (CLV)
SELECT customer_id,
       COUNT(order_id) AS total_orders,
       SUM(order_amount) AS total_spent,
       AVG(order_amount) AS avg_order_value,
       DATEDIFF(MAX(order_date), MIN(order_date)) AS customer_lifetime_days
FROM orders
GROUP BY customer_id;