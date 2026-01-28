-- Calculate year-over-year growth rate
SELECT year, 
       ((current_year_sales - previous_year_sales) / previous_year_sales) * 100 AS yoy_growth
FROM sales_growth;