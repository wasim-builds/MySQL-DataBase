-- Calculate percentage of total sales for each product
SELECT product_name, sales,
       (sales / SUM(sales) OVER ()) * 100 AS percentage_of_total_sales
FROM sales_data;