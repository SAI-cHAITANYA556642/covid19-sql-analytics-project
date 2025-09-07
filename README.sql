# COVID-19 SQL Analytics Project  <br>

## Objective <br>
Analyze COVID-19 data using SQL to generate insights, including top countries, mortality rate, and regional summaries.<br>
## Tools Used  <br>
- MySQL Workbench  <br>
## Version Control System  <br>
- git  <br>
## Dataset  <br>
Source: Kaggle (COVID-19 dataset)  <br>
File: " country_wise_latest.csv " <br>
Records: 187 (Country-wise COVID-19 data)  <br>

Columns included:  <br>
-'Country_Region'<br>
-'Confirmed' <br>
-'Deaths'<br>
-'Recovered'  <br>
-'Active'<br>  
-'New_cases' <br>  
-'New_deaths' <br>
-'New_recovered'<br>
-'Deaths_per_100_Cases' <br>
-'Recovered_per_100_Cases'<br>
-'Deaths_per_100_Recovered'<br>
-'Confirmed_last_week'  <br>
-'One_week_change'<br>
-'One_week_percent_increase'<br>
-'WHO_Region'<br>
## Database Setup  <br>
### 1. Create Database  <br>
### sql  <br>
CREATE DATABASE IF NOT EXISTS covid19_db; <br>
USE covid19_db; <br>

Create Table  <br>
Load Data <br>
Make sure the CSV file is in the MySQL Uploads folder. <br>
Path used in this project:<br>
E:/ProgramData/MySQL/MySQL Server 8.0/Uploads/country_wise_latest.csv <br>

###Sample Queries <br>
View First 10 Rows <br>
SELECT * FROM country_wise_latest LIMIT 10; <br>
## Top 10 Countries by Confirmed Cases <br>
SELECT Country_Region, Confirmed <br>
FROM country_wise_latest <br>
ORDER BY Confirmed DESC <br>
LIMIT 10; <br>
## Mortality (Death) Rate by Country <br>
SELECT Country_Region, (Deaths / Confirmed) * 100 AS DeathRate <br>
FROM country_wise_latest <br>
WHERE Confirmed > 10000 <br>
ORDER BY DeathRate DESC <br>
LIMIT 10; <br>
## Cases by WHO Region <br>
SELECT WHO_Region, SUM(Confirmed) AS TotalCases, SUM(Deaths) AS TotalDeaths <br>
FROM country_wise_latest <br>
GROUP BY WHO_Region <br>
ORDER BY TotalCases DESC; <br>
##Find Missing (or) Invalid Values  <br>
SELECT * <br>
FROM country_wise_latest <br>
WHERE Deaths_per_100_Cases IS NULL <br>
   OR Recovered_per_100_Cases IS NULL <br>
   OR Deaths_per_100_Recovered IS NULL <br>
   OR One_week_percent_increase IS NULL; <br>

##Key Concepts <br>
##SQL Database Design <br>
-->Created database covid19_db and table country_wise_latest.<br>
-->Defined appropriate data types for each column.<br>
##Data Loading<br>
-->Used LOAD DATA INFILE for efficient bulk CSV import.<br>
-->Handled missing values using NULLIF.<br>
##Data Analytics with SQL <br>
-->Aggregation using SUM, AVG. <br>
-->Ranking using ORDER BY with LIMIT. <br>
-->Filtering invalid/missing values. <br>













