
/* create the database if it not exist in your database */ 

CREATE DATABASE IF NOT EXISTS covid19_db;

/* create the database  for covid19 analysis */
create database covid19_db;
USE covid19_db;

DROP TABLE IF EXISTS country_wise_latest;
drop table country_wise_latest;

SHOW VARIABLES LIKE 'secure_file_priv';

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

USE covid19_db;

/* create the table datABASE */

CREATE TABLE country_wise_latest (
    Country_Region VARCHAR(100),
    Confirmed FLOAT,
    Deaths FLOAT,
    Recovered FLOAT,
    Active FLOAT,
    New_cases FLOAT,
    New_deaths FLOAT,
    New_recovered FLOAT,
    Deaths_per_100_Cases FLOAT,
    Recovered_per_100_Cases FLOAT,
    Deaths_per_100_Recovered FLOAT,
    Confirmed_last_week FLOAT,
    One_week_change FLOAT,
    One_week_percent_increase FLOAT,
    WHO_Region VARCHAR(50)
);
/* HERE IAM THAKEN THE DATA FROM KAGGLE.COM  AS COUNTRY_WISE_LATEST SAMPLE DATA IN THE FORM OF CSV,
 HERE IS THE PATH :'E:/ProgramData/MySQL/MySQL Server 8.0/Uploads/country_wise_latest.csv' */
/* Load CSV */
LOAD DATA INFILE 'E:/ProgramData/MySQL/MySQL Server 8.0/Uploads/country_wise_latest.csv'
INTO TABLE country_wise_latest
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Country_Region, @Confirmed, @Deaths, @Recovered, @Active, @New_cases, @New_deaths, @New_recovered,
 @Deaths_per_100_Cases, @Recovered_per_100_Cases, @Deaths_per_100_Recovered,
 @Confirmed_last_week, @One_week_change, @One_week_percent_increase, @WHO_Region)
SET
Country_Region = @Country_Region,
Confirmed = NULLIF(@Confirmed,''),
Deaths = NULLIF(@Deaths,''),
Recovered = NULLIF(@Recovered,''),
Active = NULLIF(@Active,''),
New_cases = NULLIF(@New_cases,''),
New_deaths = NULLIF(@New_deaths,''),
New_recovered = NULLIF(@New_recovered,''),
Deaths_per_100_Cases = NULLIF(@Deaths_per_100_Cases,'inf'),
Recovered_per_100_Cases = NULLIF(@Recovered_per_100_Cases,'inf'),
Deaths_per_100_Recovered = NULLIF(@Deaths_per_100_Recovered,'inf'),
Confirmed_last_week = NULLIF(@Confirmed_last_week,''),
One_week_change = NULLIF(@One_week_change,''),
One_week_percent_increase = NULLIF(@One_week_percent_increase,'inf'),
WHO_Region = @WHO_Region;

DESCRIBE country_wise_latest;

/* HERE IAM TEAKEN TOTAL 187 COUNTRY WISE SAMPLE DATADB */

SELECT * FROM country_wise_latest LIMIT 187;

SELECT *
FROM country_wise_latest
WHERE Deaths_per_100_Cases IS NULL
   OR Recovered_per_100_Cases IS NULL
   OR Deaths_per_100_Recovered IS NULL
   OR One_week_percent_increase IS NULL;
  
  /* Top 10 Countries by Confirmed Cases */
  
SELECT Country_Region, Confirmed
FROM country_wise_latest
ORDER BY Confirmed DESC
LIMIT 10;

/* Mortality OR DEATH  Rate by Country */ 

SELECT Country_Region, (Deaths / Confirmed) * 100 AS DeathRate
FROM country_wise_latest
WHERE Confirmed > 10000
ORDER BY DeathRate DESC
LIMIT 10;

/* Cases by WHO Region */

SELECT WHO_Region, SUM(Confirmed) AS TotalCases, SUM(Deaths) AS TotalDeaths
FROM country_wise_latest
GROUP BY WHO_Region
ORDER BY TotalCases DESC;

















