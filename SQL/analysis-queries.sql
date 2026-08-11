-- 01 GETTING ALL THE YEARS
SELECT DISTINCT CalendarYear as [Years]
FROM [AdventureWorksDW2022].[dbo].[DimDate];

-- 01 GETTING ALL THE YEARS IN ASCENDING
SELECT DISTINCT CalendarYear as [Years]
FROM [AdventureWorksDW2022].[dbo].[DimDate]
ORDER BY [Years] ASC;