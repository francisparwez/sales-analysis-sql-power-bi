# Sales & Business Analytics

## Overview

This project is a data analytics portfolio project built using SQL Server and Power BI. It uses the AdventureWorksDW2022 data warehouse to analyze internet sales performance, customers, products, sales representatives, and sales trends over time.

The project demonstrates an end-to-end analytics workflow, from working with a SQL Server data warehouse and preparing data for analysis to creating an interactive Power BI dashboard.

## Business Request

The Sales Manager, Steven, requested an improvement to the existing internet sales reporting process by moving from static reports to interactive visual dashboards.

The primary business requirements are to provide a clear overview of:

* How much has been sold
* Which products are selling the most
* Which customers are purchasing the most
* How sales performance has changed over time
* Sales performance by sales representative
* Sales performance compared against the 2021 budget

The business normally analyzes sales performance by looking approximately two years back in time. The 2021 budget was provided separately in an Excel spreadsheet to enable comparison between actual sales performance and budgeted performance.

The requested solution is an interactive Power BI dashboard that allows users to explore these areas through visualizations, KPIs, and filters.

## Business Demands & User Stories

### Business Demand Overview

| Requirement                    | Description                                    |
| ------------------------------ | ---------------------------------------------- |
| **Reporter**                   | Steven – Sales Manager                         |
| **Value of Change**            | Visual dashboards and improved sales reporting |
| **Necessary Systems**          | Power BI, CRM System                           |
| **Other Relevant Information** | 2021 sales budget provided in Excel            |

### User Stories

#### 1. Sales Manager – Internet Sales Overview

**As a Sales Manager**, I want an overview of internet sales so that I can better understand which customers and products are performing best.

**Acceptance Criteria:**

* Power BI dashboard providing an overview of internet sales
* Dashboard data updates once a day
* Ability to identify top-performing customers and products

#### 2. Sales Representative – Customer Analysis

**As a Sales Representative**, I want a detailed overview of internet sales by customer so that I can identify my highest-value customers and potential opportunities for additional sales.

**Acceptance Criteria:**

* Power BI dashboard provides customer-level sales analysis
* Users can filter the data by individual customer

#### 3. Sales Representative – Product Analysis

**As a Sales Representative**, I want a detailed overview of internet sales by product so that I can identify which products are selling the most.

**Acceptance Criteria:**

* Power BI dashboard provides product-level sales analysis
* Users can filter the data by individual product

#### 4. Sales Manager – Sales vs Budget

**As a Sales Manager**, I want an overview of internet sales over time compared against budget so that I can monitor sales performance against targets.

**Acceptance Criteria:**

* Power BI dashboard provides sales trends over time
* Dashboard includes graphs and KPIs
* Actual sales can be compared against the 2021 budget

## Tools & Technologies

* SQL Server
* SQL Server Management Studio (SSMS)
* Power BI
* DAX
* SQL
* AdventureWorksDW2022
* Excel

## Dataset

The project uses Microsoft's AdventureWorksDW2022 sample data warehouse.

The original AdventureWorksDW dataset contains historical data from 2010–2014. The database was updated using a SQL script to shift the dates forward so that the dataset covers more recent years. The script also extends the `DimDate` table and updates associated date keys and date fields across the fact and dimension tables.

The project focuses primarily on the internet sales data and related customer, product, employee/sales representative, and date dimensions required to address the business requirements.

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

## Data Preparation

### Fact Table vs Dimension Table

Before preparing the data for analysis, the AdventureWorks data warehouse schema is reviewed to distinguish between fact tables and dimension tables.

**Fact tables** contain measurable business events and numerical values used for analysis, while **dimension tables** provide descriptive attributes used to categorize and filter those facts.

The analysis will primarily focus on the internet sales fact table and the related dimensions required to answer the business questions.

### Identify Necessary Tables

The required tables will be identified based on the business request and user stories.

The analysis will require data related to:

* Internet sales
* Dates and time periods
* Products
* Customers
* Sales representatives
* Budget data

Only the tables and fields necessary to answer the defined business questions will be prepared for the analytical model.

### Data Cleansing & Transformation

Data cleansing and transformation is being performed before the data is used for analysis and Power BI.

The first completed step is the cleansing and preparation of the `DimDate` table.

#### DIM_Calendar Transformation

The original `DimDate` table contains a number of fields that are not required for the current analysis. A SQL query was used to select the relevant date attributes and rename several fields for easier use in the analytical model.

The transformation includes:

* Selecting `DateKey`
* Renaming `FullDateAlternateKey` to `Date`
* Using the English day name as `Day`
* Selecting `WeekNumberOfYear` as `WeekNr`
* Selecting `EnglishMonthName` as `Month`
* Creating a three-character `MonthShort` field
* Selecting `MonthNumberOfYear` as `MonthNo`
* Selecting `CalendarQuarter` as `Quarter`
* Selecting `CalendarYear` as `Year`
* Excluding unused day, language, semester, and fiscal fields

The transformed data was exported from SQL Server as:

```text
CSV/DIM_Calendar.csv
```

This represents the first completed step of the data cleansing and transformation process. Additional fact and dimension tables will be prepared in subsequent stages.

## Project Workflow

1. Set up the AdventureWorksDW2022 database in SQL Server
2. Update the database dates to more recent years
3. Review the business request and define analytical requirements
4. Understand fact tables and dimension tables
5. Identify the tables and fields required to answer the business questions
6. Cleanse and transform the required data
7. Export prepared datasets where required
8. Query and analyze internet sales data using SQL
9. Prepare the required data for Power BI
10. Import/connect the data to Power BI
11. Build the Power BI data model and relationships
12. Create DAX measures and calculated columns
13. Incorporate the 2021 budget data
14. Develop interactive dashboards and visualizations
15. Validate the dashboard against the business requirements
16. Extract and document key business insights

## Analysis

The analysis will focus on the following business areas:

* **Internet Sales Performance**
* **Product Performance**
* **Customer Performance**
* **Sales Representative Performance**
* **Sales Trends Over Time**
* **Actual Sales vs Budget**
* **Key Sales KPIs**

The dashboard will allow users to filter and explore sales performance by relevant customers, products, sales representatives, and time periods.

## Dashboard

The Power BI dashboard will provide an interactive view of internet sales performance, including:

* Sales KPIs
* Sales trends over time
* Product performance
* Customer performance
* Sales representative performance
* Actual sales vs 2021 budget
* Interactive filters and slicers

Power BI dashboard screenshots will be added here.

## SQL Analysis

SQL queries used for data exploration, preparation, transformation, and analysis will be added here.

The SQL analysis will focus on extracting and preparing the data required to answer the business questions defined in the user stories.

## Key Insights

Key findings from the analysis will be documented here once the SQL and Power BI analysis is complete.

Insights will focus on areas such as:

* Top-performing products
* Highest-value customers
* Sales representative performance
* Sales trends
* Budget performance
* Areas of over- and under-performance

## Project Structure

```text
Sales-Business-Analytics/
│
├── SQL/
│   ├── UpdateAdventureWorksDates.sql
│   └── Analysis.sql
│
├── PowerBI/
│   └── AdventureWorks_Analytics.pbix
│
├── Images/
│   └── dashboard-preview.png
│
├── CSV/
│   └── DIM_Calendar.csv
│
└── README.md
```
