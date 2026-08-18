-- 01 GETTING ALL THE YEARS
SELECT DISTINCT CalendarYear as [Years]
FROM [AdventureWorksDW2022].[dbo].[DimDate];

-- 02 GETTING ALL THE YEARS IN ASCENDING
SELECT DISTINCT CalendarYear as [Years]
FROM [AdventureWorksDW2022].[dbo].[DimDate]
ORDER BY [Years] ASC;

-- 03 CLEANSED DIM_Date TABLE --
SELECT
    [DateKey],
    [FullDateAlternateKey] AS Date,
    --[DayNumberOfWeek],
    [EnglishDayNameOfWeek] AS Day,
    --[SpanishDayNameOfWeek],
    --[FrenchDayNameOfWeek],
    --[DayNumberOfMonth],
    --[DayNumberOfYear],
    [WeekNumberOfYear] AS WeekNr,
    [EnglishMonthName] AS Month,
    LEFT([EnglishMonthName], 3) AS MonthShort,
    --[SpanishMonthName],
    --[FrenchMonthName],
    [MonthNumberOfYear] AS MonthNo,
    [CalendarQuarter] AS Quarter,
    [CalendarYear] AS Year
    --[CalendarSemester],
    --[FiscalQuarter],
    --[FiscalYear],
    --[FiscalSemester]
FROM
    [AdventureWorksDW2022].[dbo].[DimDate]
WHERE
    CalendarYear >= 2019;

-- 04 CLEANSED DIM_Customers TABLE --
SELECT
    c.CustomerKey AS CustomerKey,
    -- c.GeographyKey,
    -- c.CustomerAlternateKey,
    -- c.Title,
    c.FirstName AS [First Name],
    -- c.MiddleName,
    c.LastName AS [Last Name],
    c.FirstName + ' ' + c.LastName AS [Full Name],
    -- Combined First and Last Name
	-- c.NameStyle,
    -- c.BirthDate,
    -- c.MaritalStatus,
    -- c.Suffix,
    CASE
        WHEN c.Gender = 'M' THEN 'Male'
        WHEN c.Gender = 'F' THEN 'Female'
    END AS Gender,
    -- c.EmailAddress,
    -- c.YearlyIncome,
    -- c.TotalChildren,
    -- c.NumberChildrenAtHome,
    -- c.EnglishEducation,
    -- c.SpanishEducation,
    -- c.FrenchEducation,
    -- c.EnglishOccupation,
    -- c.SpanishOccupation,
    -- c.FrenchOccupation,
    -- c.HouseOwnerFlag,
    -- c.NumberCarsOwned,
    -- c.AddressLine1,
    -- c.AddressLine2,
    -- c.Phone,
    c.DateFirstPurchase AS DateFirstPurchase,
    -- c.CommuteDistance,
    g.City AS [Customer City] -- Joined in Customer City from Geography Table
FROM dbo.DimCustomer AS c
LEFT JOIN dbo.DimGeography AS g
    ON g.GeographyKey = c.GeographyKey
ORDER BY
    CustomerKey ASC; -- Ordered List by CustomerKey

-- 05 CLEANSED DIM_Products TABLE --
SELECT
    p.[ProductKey],
    p.[ProductAlternateKey] AS ProductItemCode,
    -- [ProductSubcategoryKey],
    -- [WeightUnitMeasureCode],
    -- [SizeUnitMeasureCode],
    p.[EnglishProductName] AS [Product Name],
    ps.EnglishProductSubcategoryName AS [Sub Category], -- Joined in from Sub Category Table
    pc.EnglishProductCategoryName AS [Product Category], -- Joined in from Category Table
    -- [SpanishProductName],
    -- [FrenchProductName],
    -- [StandardCost],
    -- [FinishedGoodsFlag],
    p.[Color] AS [Product Color],
    -- [SafetyStockLevel],
    -- [ReorderPoint],
    -- [ListPrice],
    p.[Size] AS [Product Size],
    -- [SizeRange],
    -- [Weight],
    -- [DaysToManufacture],
    p.[ProductLine] AS [Product Line],
    -- [DealerPrice],
    -- [Class],
    -- [Style],
    p.[ModelName] AS [Product Model Name],
	-- [LargePhoto],
    p.[EnglishDescription] AS [Product Description],
    -- [FrenchDescription],
    -- [ChineseDescription],
    -- [ArabicDescription],
    -- [HebrewDescription],
    -- [ThaiDescription],
    -- [GermanDescription],
	-- [JapaneseDescription],
    -- [TurkishDescription],
    -- [StartDate],
    -- [EndDate],
    ISNULL(p.Status, 'Outdated') AS [Product Status]
FROM [dbo].[DimProduct] AS p
LEFT JOIN dbo.DimProductSubcategory AS ps
    ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
LEFT JOIN dbo.DimProductCategory AS pc
    ON ps.ProductCategoryKey = pc.ProductCategoryKey
ORDER BY
    p.ProductKey ASC;

-- 06 CLEANSED FACT_InternetSales TABLE --
SELECT
    [ProductKey],
    [OrderDateKey],
    [DueDateKey],
    [ShipDateKey],
    [CustomerKey],
    -- [PromotionKey],
    -- [CurrencyKey],
    -- [SalesTerritoryKey],
    [SalesOrderNumber],
    -- [SalesOrderLineNumber],
    -- [RevisionNumber],
    -- [OrderQuantity],
    -- [UnitPrice],
    -- [ExtendedAmount],
    -- [UnitPriceDiscountPct],
    -- [DiscountAmount],
    -- [ProductStandardCost],
    -- [TotalProductCost],
	-- [TaxAmt],
    -- [Freight],
    -- [CarrierTrackingNumber],
    -- [CustomerPONumber],
    -- [OrderDate],
    -- [DueDate],
    -- [ShipDate],
    [SalesAmount]
FROM
    [dbo].[FactInternetSales]
WHERE
    LEFT(OrderDateKey, 4) >= YEAR(GETDATE()) - 2
    -- Ensures we always only bring two years of data from extraction.
ORDER BY
    OrderDateKey ASC;