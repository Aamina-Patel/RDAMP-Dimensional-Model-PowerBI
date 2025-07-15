-- REUSABLE QUERIES
-- Top 5 products by profit
SELECT dp.product_name, SUM(fs.profit) AS profit
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dp.product_name
ORDER BY profit DESC
LIMIT 5;

-- Average discount per segment
SELECT dp.segment_name, AVG(fs.discount_amount) AS avg_discount
FROM fact_sales fs
JOIN dim_product dp ON dp.product_id = fs.product_id
GROUP BY dp.segment_name;

-- Sales by region and channel
SELECT dl.region, dom.order_mode, SUM(fs.total_sales) AS sales
FROM fact_sales fs
JOIN dim_location dl ON fs.location_id = dl.location_id
JOIN dim_order_mode dom ON fs.order_mode_id = dom.order_mode_id
GROUP BY dl.region, dom.order_mode;

-- Profit margin per category
SELECT dp.category_name, SUM(fs.profit) / SUM(fs.total_sales) AS profit_margin
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dp.category_name;

-- Order frequency by customer
SELECT customer_id, COUNT(order_id) AS order_frequency
FROM fact_sales
GROUP BY customer_id;
