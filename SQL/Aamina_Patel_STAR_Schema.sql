-- DIMENSION TABLES
-- PRODUCT DIMENSION TABLE
CREATE TABLE dim_product (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(100),
    category_name VARCHAR(100),
    segment_name VARCHAR(50),
    sub_category VARCHAR(100)
);

INSERT INTO dim_product (product_id, product_name, category_name, segment_name, sub_category)
SELECT 
    DISTINCT TRIM(`Product ID`),
    TRIM(`Product Name`),
    trim(Category),
    trim(Segment),
    TRIM(`Sub-Category`)
FROM ace_sales;

-- LOCATION DIMENSION TABLE
CREATE TABLE dim_location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(50),
    postal_code VARCHAR(50),
    region VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO dim_location (city, postal_code, region, country)
SELECT 
    DISTINCT TRIM(City),
    TRIM(`Postal Code`),
    trim(Country),
    trim(Region)
FROM ace_sales;

-- ORDER MODE DIMENSION TABLE
CREATE TABLE dim_order_mode (
    order_mode_id INT AUTO_INCREMENT PRIMARY KEY,
    order_mode VARCHAR(50) UNIQUE
);

INSERT INTO dim_order_mode (order_mode)
SELECT 
    DISTINCT TRIM(`Order Mode`)
FROM ace_sales;

-- DATE DIMENSION TABLE
## Update date format
ALTER TABLE ace_sales ADD COLUMN order_date_temp DATE;
UPDATE ace_sales
SET order_date_temp = STR_TO_DATE(`Order Date`, '%d/%m/%Y');
ALTER TABLE ace_sales DROP COLUMN `Order Date`;
ALTER TABLE ace_sales CHANGE order_date_temp `Order Date` DATE;

CREATE TABLE dim_date (
    date_id INT auto_increment PRIMARY KEY,
    order_date DATE,
    year INT,
    month INT,
    quarter INT
); 

INSERT INTO dim_date (order_date, year, month, quarter)
SELECT DISTINCT
    STR_TO_DATE(`Order Date`, '%d/%m/%Y') AS order_date,
    YEAR(STR_TO_DATE(`Order Date`, '%d/%m/%Y')),
    MONTH(STR_TO_DATE(`Order Date`, '%d/%m/%Y')),
    QUARTER(STR_TO_DATE(`Order Date`, '%d/%m/%Y'))
FROM ace_sales;

-- FACT TABLE
CREATE TABLE fact_sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    location_id INT,
    date_id INT,
    order_mode_id INT,
    quantity INT,
    total_sales DECIMAL(10,2),
    total_cost DECIMAL(10,2),
    profit DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (order_mode_id) REFERENCES dim_order_mode(order_mode_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);

INSERT INTO fact_sales (
    order_id,
    customer_id,
    product_id,
    location_id,
    date_id,
    order_mode_id,
    quantity,
    total_sales,
    total_cost,
    profit,
    discount_amount
)
SELECT 
    s.`Order ID`,
    TRIM(s.`Customer ID`),
    TRIM(s.`Product ID`),
    dl.location_id,
    dd.date_id,
    dom.order_mode_id,
    s.Quantity,
    s.Revenue,
    s.`COS`,
    s.Profit,
    s.`Discount Amount`
FROM ace_sales s
LEFT JOIN dim_location dl ON 
	s.city = dl.city AND
    s.`Postal Code` = dl.postal_code AND
    s.country = dl.country AND
    s.region = dl.region
JOIN dim_date dd ON s.`Order Date` = dd.order_date
LEFT JOIN dim_order_mode dom ON s.`Order Mode` = dom.order_mode;

UPDATE fact_sales
SET location_id = 1
WHERE location_id IS NULL;
