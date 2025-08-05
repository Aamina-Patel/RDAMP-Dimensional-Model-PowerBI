# ACE Superstore - Dimensional Modelling, SQL Transformation & Power BI Reporting Project

### Introduction

In this project, I took the ACE Superstore Retail dataset I worked on last week and transitioned it into a format optimized for enterprise-grade reporting. Business users will be able to analyse performance from multiple angles using a data model designed for usability and scalability.

### Problem Statement

ACE Superstore now aims to build a structured, query-optimized reporting system. My responsibility in this task was twofold:
 
1. Design and implement a star schema using SQL.
2. Create SQL views from your schema and connect them directly to Power BI to produce advanced interactive dashboards.

### My Approach and Tools Used

I used MySQL to build the star schema model, views and wrote 5 reusable SQL queries. I then connected MySQL to PowerBI and created the dashboard.

### Overview of My Dimensional Schema 

<img width="1075" height="652" alt="Aamina_Patel_Schema_Diagram" src="https://github.com/user-attachments/assets/69ccf187-6b39-476c-8fbf-4d6e2a670280" />


### Dimensions and Fact Table

The fact table contains the foreign keys referencing the relevant dimension tables and measures including revenue, cost of sales, profit, discount amount and quantity. 

I chose to create the following dimensional tables as they best suited the requirements of ACE:
 - dim_product - contains all product information e.g. name, category, sub-category and segment
 - dim_location - contains all store locations e.g. city, postal code, region and country
 - dim_date - contains order date, month, quarter and year for time-based analysis
 - dim_order_mode - contains two order modes, online and in-store

### SQL Setup Instructions

1. Change ACE Superstore Retail dataset from Excel Workbook to CSV
2. Create the rdamp_task_2 schema/database in MySQL
3. Use the table data import wizard to load the table into the database
4. After this you can run the code I've uploaded into the repository to build the star schema

### Power BI Connection Steps

1. To connect MySQL to PowerBI, you need to download the ODBC connector from the MySQL download website. Make sure you download the one that matches your PowerBI (32 or 64 bit)
2. Once it is installed, open the programme and go to the System DSN tab. Click add, find and select MySQL ODBC 8.3 Unicode Driver and fill out the fields. Click test to validate the connection is working and then click OK
3. Open PowerBI, go to home, get data, ODBC, find your data source name you filled in during step 2 then OK

### Screenshot of Dashboard

<img width="1428" height="802" alt="Aamina_Patel_Final_Dashboard" src="https://github.com/user-attachments/assets/5e37fc8c-63bc-487b-b06f-e0a30fb43e0a" />

## Insights from the Dashboard
Key insights include:

#### 1. Category Ranking by Region
- Top-performing category: Outdoor generated the highest profit at £310,979.01
- Low-performing category: Seasonings generated the lowest profit at £92.35
- England and Scotlands top performing category is Outdoor, Northern Irelands is Kitchen and Wales is Home
- Englands low performing category is Condiments, Scotlands is Grains, Northern Irelands is Breakfast and Wales is Computers
  
#### 2. Top 10 Customers by Profit Contribution
- Top Customer: The 1st customer with the highest profit contribution had a profit figure of £47,588.68
- 10th Customer: The 10th customer with the highest profit contribution had a profit figure of £15,243.03

#### 3. Product Seasonality Trends
- Products that sell more in the summer months include, Electric Bike, Portable Air Conditioner and Portable Solar Generator
- A Digital Camera is a popular product in December, most likely beacuse people are buying this as a gift

#### 4. Discount vs Profit Analysis
- Discount and profit are positively correlated

#### 5. Average Order Value by Channel & Segment
- The Outdoor segment has the highest average order value of £202,355.21 

## Recommendations

- Increase our inventory of high performing categories and try to phase out low performing categories
- Conduct questionaires to see why customers don't like the low performing categories and improve the categories
- Launch a loyalty scheme where customers with the highest profit contributions get the higest discounts
- Give customers discounts on products when in season (e.g. give discounts for Digital Cameras in December)

## Realcare Tech Mark Data Analyst Mentorship Programme
- Created by: Aamina Patel
- Built with: MySQL & Power BI
- Data Source: RealCare Tech Mark LTD
