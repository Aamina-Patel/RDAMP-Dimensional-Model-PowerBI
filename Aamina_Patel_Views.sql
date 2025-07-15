-- CREATE VIEWS
CREATE VIEW vw_product_seasonality AS 
SELECT 
    dp.product_name,
    dd.month,
    dd.year,
    SUM(fs.total_sales) AS monthly_sales
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
JOIN dim_date dd ON fs.date_id = dd.date_id
GROUP BY dp.product_name, dd.year, dd.month;


CREATE VIEW vw_discount_impact_analysis AS
SELECT 
    fs.discount_amount,
    fs.profit,
    dp.product_name
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id;


CREATE VIEW vw_customer_order_patterns AS
SELECT 
	fs.customer_id,
    dp.segment_name,
    dom.order_mode,
    COUNT(fs.order_id) AS order_count,
    AVG(fs.total_sales) AS avg_order_value,
    SUM(fs.profit) AS total_profit
FROM fact_sales fs
JOIN dim_product dp ON dp.product_id = fs.product_id
JOIN dim_order_mode dom ON dom.order_mode_id = fs.order_mode_id
GROUP BY dp.segment_name, dom.order_mode, fs.customer_id;


CREATE VIEW vw_channel_margin_report AS
SELECT 
    dom.order_mode,
    SUM(fs.profit) AS total_profit
FROM fact_sales fs
JOIN dim_order_mode dom ON fs.order_mode_id = dom.order_mode_id
GROUP BY dom.order_mode;


CREATE VIEW vw_region_category_rankings AS
SELECT 
    dl.region,
    dp.category_name,
    SUM(fs.profit) AS total_profit
FROM fact_sales fs
JOIN dim_location dl ON fs.location_id = dl.location_id
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dl.region, dp.category_name
ORDER BY dl.region, total_profit DESC;


