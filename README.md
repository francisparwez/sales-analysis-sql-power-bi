# Sales & Business Analytics

## Overview

This project is a data analytics portfolio project built using SQL Server and Power BI. It uses the AdventureWorksDW2022 data warehouse to analyze sales performance, customers, products, and other business metrics.

The project demonstrates an end-to-end analytics workflow, from working with a SQL Server data warehouse and preparing data for analysis to creating an interactive Power BI dashboard.

## Tools & Technologies

* SQL Server
* SQL Server Management Studio (SSMS)
* Power BI
* DAX
* SQL
* AdventureWorksDW2022

## Dataset

The project uses Microsoft's AdventureWorksDW2022 sample data warehouse.

The original AdventureWorksDW dataset contains historical data from 2010–2014. The database was updated using a SQL script to shift the dates forward so that the dataset covers more recent years. The script also extends the `DimDate` table and updates associated date keys and date fields across the fact and dimension tables.

## Setup & Installation

The AdventureWorksDW2022 database backup file is **not included in this repository** because of its large file size.

### 1. Download AdventureWorksDW2022

Download the `AdventureWorksDW2022.bak` backup file from Microsoft's official AdventureWorks documentation:

[AdventureWorks Installation and Configuration](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure)

### 2. Copy the Backup File

After downloading the `AdventureWorksDW2022.bak` file, copy it to your SQL Server backup directory.

For example:

```text
C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup
```

> The exact backup directory may differ depending on your SQL Server installation and instance.

### 3. Restore the Database

Open **SQL Server Management Studio (SSMS)** and connect to your SQL Server instance.

Restore the `AdventureWorksDW2022` database using the downloaded `.bak` file.

The restored database will be used as the primary data source for the SQL analysis and Power BI dashboard.

### 4. Update the Database Dates

The original AdventureWorksDW dataset contains historical data from 2010–2014. A SQL script is included in this repository to shift the database dates forward to more recent years.

The script:

* Calculates the current year.
* Determines the number of years the existing data needs to be shifted.
* Extends the `DimDate` table with additional dates.
* Updates date fields across relevant fact and dimension tables.
* Updates the associated `DateKey` values.
* Updates year-based fields such as `CalendarYear`, `FirstOrderYear`, `LastOrderYear`, and `YearOpened`.
* Temporarily removes relevant foreign key constraints while the date updates are performed.
* Recreates the foreign key constraints after the updates are complete.

Run the date-update SQL script against the `AdventureWorksDW2022` database in SSMS.

### 5. Verify the Database

After running the update script, verify that:

* `AdventureWorksDW2022` is accessible in SSMS.
* The `DimDate` table contains the newly added dates.
* Fact and dimension tables contain the updated dates.
* Date keys remain consistent with the updated dates.
* Foreign key constraints have been restored successfully.

## Project Workflow

1. Set up the AdventureWorksDW2022 database in SQL Server
2. Update the database dates to more recent years
3. Explore and understand the data warehouse schema
4. Query and analyze the data using SQL
5. Prepare data for Power BI
6. Build data models and relationships in Power BI
7. Create DAX measures and calculated columns
8. Develop interactive dashboards
9. Extract business insights from the analysis

## Analysis

The project will explore areas including:

* Sales performance
* Product performance
* Customer analysis
* Regional performance
* Sales trends
* Profitability
* Key business KPIs

## Dashboard

Power BI dashboard screenshots will be added here.

## SQL Analysis

SQL queries used for data exploration, transformation, and analysis will be added here.

## Key Insights

Key findings from the analysis will be documented here once the Power BI analysis is complete.
