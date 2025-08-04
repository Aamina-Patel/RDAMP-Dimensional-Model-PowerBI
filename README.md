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
 - dim_product
 - dim_location
 - dim_date
 - dim_order_mode

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

<img width="1417" height="797" alt="Aamina_Patel_Dashboard" src="https://github.com/user-attachments/assets/18929ed0-66d0-44a3-aca2-8b9e283ce754" />


